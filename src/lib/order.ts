import rawCatalog from '../../data/catalog.json';
import { validateDeliveryPostcode } from './delivery-radius';
import { OrderValidationError } from './order-validation';
import { supabaseAdmin } from './supabase-server';

function generateReference(): string {
  const now = new Date();
  const ymd = now.toISOString().slice(0, 10).replace(/-/g, '');
  const rand = Math.random().toString(36).substring(2, 6).toUpperCase();
  return `SP-${ymd}-${rand}`;
}

/** Sequential refs e.g. SP00000250 — requires migration `allocate_spearings_order_ref`. */
async function allocateNextReference(): Promise<string> {
  try {
    const { data, error } = await supabaseAdmin.rpc('allocate_spearings_order_ref');
    if (!error && data != null && typeof data === 'string' && data.startsWith('SP')) {
      return data;
    }
  } catch {
    /* fall through */
  }
  console.warn('allocate_spearings_order_ref unavailable; using dated fallback reference');
  return generateReference();
}

interface ProductLookup {
  slug: string;
  name: string;
  price: number;
}

async function lookupProducts(slugs: string[]): Promise<Map<string, ProductLookup>> {
  // Try Supabase first
  try {
    const { data, error } = await supabaseAdmin
      .from('products')
      .select('slug, name, price')
      .in('slug', slugs);

    if (!error && data?.length) {
      return new Map(data.map((p) => [p.slug, p]));
    }
  } catch { /* fall through to local catalog */ }

  // Fall back to local catalog.json
  const localProducts = (rawCatalog as any).products ?? [];
  const map = new Map<string, ProductLookup>();
  for (const p of localProducts) {
    if (slugs.includes(p.slug) && p.price != null) {
      map.set(p.slug, { slug: p.slug, name: p.name, price: p.price });
    }
  }
  return map;
}

export interface CreateOrderInput {
  items: Array<{ slug: string; quantity: number }>;
  customer: { name: string; email: string; phone?: string };
  delivery: {
    type: 'collection' | 'delivery';
    date: string;
    address_line1?: string;
    address_line2?: string;
    city?: string;
    postcode?: string;
  };
  notes?: string;
  /** Same browser checkout session — prevents duplicate pending orders / Stripe intents on retry. */
  idempotencyKey?: string;
}

interface OrderResult {
  reference: string;
  orderId: string;
  subtotal: number;
  shipping: number;
  total: number;
}

export async function createOrder(input: CreateOrderInput): Promise<OrderResult> {
  const productMap = await lookupProducts(input.items.map((i) => i.slug));

  if (productMap.size === 0) {
    throw new Error('Could not look up products');
  }

  if (input.delivery.type === 'delivery') {
    const radius = await validateDeliveryPostcode(input.delivery.postcode);
    if (!radius.ok) {
      throw new OrderValidationError(radius.error);
    }
  }

  let subtotal = 0;
  const orderItems: Array<{
    product_slug: string;
    product_name: string;
    quantity: number;
    unit_price: number;
    line_total: number;
  }> = [];

  for (const item of input.items) {
    const product = productMap.get(item.slug);
    if (!product || product.price == null) {
      throw new Error(`Product not found or not orderable: ${item.slug}`);
    }
    const unitPrice = Math.round(product.price * 100);
    const lineTotal = unitPrice * item.quantity;
    subtotal += lineTotal;
    orderItems.push({
      product_slug: product.slug,
      product_name: product.name,
      quantity: item.quantity,
      unit_price: unitPrice,
      line_total: lineTotal,
    });
  }

  const settings = new Map<string, string>([
    ['delivery_fee_pence', '500'],
    ['free_delivery_threshold_pence', '3000'],
  ]);
  try {
    const { data: settingsData } = await supabaseAdmin
      .from('order_settings')
      .select('key, value');
    for (const row of settingsData ?? []) settings.set(row.key, row.value);
  } catch { /* use defaults if table doesn't exist yet */ }

  let shipping = 0;
  if (input.delivery.type === 'delivery') {
    const fee = parseInt(settings.get('delivery_fee_pence') ?? '500', 10);
    const threshold = parseInt(settings.get('free_delivery_threshold_pence') ?? '3000', 10);
    shipping = subtotal >= threshold ? 0 : fee;
  }

  const total = subtotal + shipping;
  const reference = await allocateNextReference();

  const { data: order, error: orderErr } = await supabaseAdmin
    .from('orders')
    .insert({
      reference,
      status: 'pending',
      customer_name: input.customer.name,
      customer_email: input.customer.email.toLowerCase().trim(),
      customer_phone: input.customer.phone || null,
      order_type: input.delivery.type,
      delivery_date: input.delivery.date,
      delivery_address_line1: input.delivery.address_line1 || null,
      delivery_address_line2: input.delivery.address_line2 || null,
      delivery_city: input.delivery.city || null,
      delivery_postcode: input.delivery.postcode || null,
      subtotal,
      shipping,
      total,
      notes: input.notes || null,
      checkout_idempotency_key: input.idempotencyKey?.trim() || null,
    })
    .select('id')
    .single();

  if (orderErr || !order) {
    throw new Error(`Failed to create order: ${orderErr?.message}`);
  }

  const itemRows = orderItems.map((item) => ({
    ...item,
    order_id: order.id,
  }));

  const { error: itemsErr } = await supabaseAdmin.from('order_items').insert(itemRows);

  if (itemsErr) {
    throw new Error(`Failed to create order items: ${itemsErr.message}`);
  }

  return { reference, orderId: order.id, subtotal, shipping, total };
}

export type OrderPaymentRow = {
  id: string;
  reference: string;
  total: number;
  subtotal: number;
  shipping: number;
  stripe_client_secret: string | null;
  stripe_payment_intent_id: string | null;
  customer_name: string;
  status: string;
};

/** Replay safe: same checkout idempotency key returns the same order row. */
export async function getOrderByIdempotencyKey(key: string): Promise<OrderPaymentRow | null> {
  const { data, error } = await supabaseAdmin
    .from('orders')
    .select(
      'id, reference, total, subtotal, shipping, stripe_client_secret, stripe_payment_intent_id, customer_name, status',
    )
    .eq('checkout_idempotency_key', key.trim())
    .maybeSingle();

  if (error || !data) return null;
  return data as OrderPaymentRow;
}

export async function updateOrderPaymentIntent(
  orderId: string,
  paymentIntentId: string,
  clientSecret: string,
): Promise<void> {
  const { error } = await supabaseAdmin
    .from('orders')
    .update({
      stripe_payment_intent_id: paymentIntentId,
      stripe_client_secret: clientSecret,
    })
    .eq('id', orderId);

  if (error) throw new Error(`Failed to update order with payment intent: ${error.message}`);
}

export async function confirmOrder(paymentIntentId: string): Promise<{ reference: string; email: string } | null> {
  const { data, error } = await supabaseAdmin
    .from('orders')
    .update({ status: 'confirmed', confirmed_at: new Date().toISOString() })
    .eq('stripe_payment_intent_id', paymentIntentId)
    .eq('status', 'pending')
    .select('reference, customer_email')
    .single();

  if (error || !data) return null;
  return { reference: data.reference, email: data.customer_email };
}

export async function failOrder(paymentIntentId: string): Promise<void> {
  await supabaseAdmin
    .from('orders')
    .update({ status: 'cancelled' })
    .eq('stripe_payment_intent_id', paymentIntentId)
    .eq('status', 'pending');
}
