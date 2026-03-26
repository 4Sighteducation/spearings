import type { APIRoute } from 'astro';
import { getAdminFromRequest } from '../../../lib/admin-auth';
import { supabaseAdmin } from '../../../lib/supabase-server';

function json(data: unknown, status = 200) {
  return new Response(JSON.stringify(data), {
    status,
    headers: { 'Content-Type': 'application/json' },
  });
}

/** GET /api/admin/order-detail?id=<uuid> — order header + line items for admin popup */
export const GET: APIRoute = async ({ request }) => {
  const admin = getAdminFromRequest(request);
  if (!admin) return json({ error: 'Unauthorized' }, 401);

  const url = new URL(request.url);
  const id = url.searchParams.get('id')?.trim();
  if (!id) return json({ error: 'Missing id' }, 400);

  const { data: order, error: orderErr } = await supabaseAdmin
    .from('orders')
    .select(
      'id, reference, customer_name, customer_email, customer_phone, order_type, delivery_date, delivery_address_line1, delivery_address_line2, delivery_city, delivery_postcode, subtotal, shipping, total, status, notes, created_at, stripe_payment_intent_id, confirmed_at',
    )
    .eq('id', id)
    .maybeSingle();

  if (orderErr || !order) return json({ error: 'Not found' }, 404);

  const { data: items } = await supabaseAdmin
    .from('order_items')
    .select('product_name, product_slug, quantity, unit_price, line_total')
    .eq('order_id', id)
    .order('product_name', { ascending: true });

  return json({ order, items: items ?? [] });
};
