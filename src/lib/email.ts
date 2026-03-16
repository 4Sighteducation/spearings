import { Resend } from 'resend';
import { getEnv } from './env';
import { supabaseAdmin } from './supabase-server';

const resend = new Resend(getEnv('RESEND_API_KEY'));
const notificationEmail = getEnv('ORDER_NOTIFICATION_EMAIL') || 'pies@spearings.co.uk';
const siteUrl = getEnv('PUBLIC_SITE_URL') || 'https://spearings.co.uk';

interface OrderForEmail {
  reference: string;
  customer_name: string;
  customer_email: string;
  order_type: string;
  delivery_date: string;
  subtotal: number;
  shipping: number;
  total: number;
  notes: string | null;
  delivery_address_line1: string | null;
  delivery_city: string | null;
  delivery_postcode: string | null;
  items: Array<{
    product_name: string;
    quantity: number;
    unit_price: number;
    line_total: number;
  }>;
}

async function getOrderForEmail(reference: string): Promise<OrderForEmail | null> {
  const { data, error } = await supabaseAdmin
    .from('orders')
    .select(`
      reference, customer_name, customer_email, order_type, delivery_date,
      subtotal, shipping, total, notes,
      delivery_address_line1, delivery_city, delivery_postcode,
      order_items ( product_name, quantity, unit_price, line_total )
    `)
    .eq('reference', reference)
    .single();

  if (error || !data) return null;
  return { ...data, items: data.order_items ?? [] } as OrderForEmail;
}

function formatPence(p: number): string {
  return `£${(p / 100).toFixed(2)}`;
}

function formatDate(d: string): string {
  return new Date(d + 'T00:00:00').toLocaleDateString('en-GB', {
    weekday: 'long',
    day: 'numeric',
    month: 'long',
    year: 'numeric',
  });
}

function buildCustomerEmailHtml(order: OrderForEmail): string {
  const itemRows = order.items.map(
    (i) =>
      `<tr><td style="padding:8px 0;border-bottom:1px solid #eee;">${i.product_name}</td>` +
      `<td style="padding:8px 0;border-bottom:1px solid #eee;text-align:center;">${i.quantity}</td>` +
      `<td style="padding:8px 0;border-bottom:1px solid #eee;text-align:right;">${formatPence(i.line_total)}</td></tr>`,
  ).join('');

  const address = order.order_type === 'delivery'
    ? `<p><strong>Delivery to:</strong> ${order.delivery_address_line1}, ${order.delivery_city} ${order.delivery_postcode}</p>`
    : `<p><strong>Collection from:</strong> 12 Park Green, Macclesfield SK11 7NA</p>`;

  return `
    <div style="font-family:'DM Sans',system-ui,sans-serif;max-width:560px;margin:0 auto;color:#1a1a18;">
      <div style="background:#0e2318;padding:24px;text-align:center;border-radius:12px 12px 0 0;">
        <h1 style="color:#f5edd8;margin:0;font-size:22px;">Order Confirmed</h1>
      </div>
      <div style="padding:24px;border:1px solid #eee;border-top:none;border-radius:0 0 12px 12px;">
        <p>Hi ${order.customer_name},</p>
        <p>Thank you for your order! Here are your details:</p>
        <div style="background:#f5f0e0;padding:16px;border-radius:8px;margin:16px 0;">
          <p style="margin:0;"><strong>Reference:</strong> ${order.reference}</p>
          <p style="margin:8px 0 0;"><strong>Date:</strong> ${formatDate(order.delivery_date)}</p>
          <p style="margin:8px 0 0;"><strong>Type:</strong> ${order.order_type === 'delivery' ? 'Delivery' : 'Collection'}</p>
        </div>
        ${address}
        <table style="width:100%;border-collapse:collapse;margin:16px 0;">
          <thead><tr>
            <th style="text-align:left;padding:8px 0;border-bottom:2px solid #1f4a2e;font-size:13px;">Item</th>
            <th style="text-align:center;padding:8px 0;border-bottom:2px solid #1f4a2e;font-size:13px;">Qty</th>
            <th style="text-align:right;padding:8px 0;border-bottom:2px solid #1f4a2e;font-size:13px;">Total</th>
          </tr></thead>
          <tbody>${itemRows}</tbody>
        </table>
        <div style="text-align:right;margin-top:8px;">
          <p style="margin:4px 0;font-size:14px;">Subtotal: ${formatPence(order.subtotal)}</p>
          ${order.shipping > 0 ? `<p style="margin:4px 0;font-size:14px;">Delivery: ${formatPence(order.shipping)}</p>` : ''}
          <p style="margin:8px 0 0;font-size:18px;font-weight:700;">Total: ${formatPence(order.total)}</p>
        </div>
        ${order.notes ? `<p style="margin-top:16px;"><strong>Notes:</strong> ${order.notes}</p>` : ''}
        <hr style="border:none;border-top:1px solid #eee;margin:24px 0;">
        <p style="font-size:13px;color:#666;">Spearings Butchers &middot; 12 Park Green, Macclesfield SK11 7NA &middot; 01625 424395</p>
      </div>
    </div>
  `;
}

function buildShopNotificationHtml(order: OrderForEmail): string {
  const itemList = order.items.map(
    (i) => `<li>${i.quantity}x ${i.product_name} — ${formatPence(i.line_total)}</li>`,
  ).join('');

  return `
    <div style="font-family:system-ui,sans-serif;max-width:560px;color:#1a1a18;">
      <h2>New Order: ${order.reference}</h2>
      <p><strong>Customer:</strong> ${order.customer_name} (${order.customer_email})</p>
      <p><strong>Type:</strong> ${order.order_type === 'delivery' ? 'Delivery' : 'Collection'}</p>
      <p><strong>Date:</strong> ${formatDate(order.delivery_date)}</p>
      ${order.order_type === 'delivery' ? `<p><strong>Address:</strong> ${order.delivery_address_line1}, ${order.delivery_city} ${order.delivery_postcode}</p>` : ''}
      <p><strong>Total:</strong> ${formatPence(order.total)}</p>
      <ul>${itemList}</ul>
      ${order.notes ? `<p><strong>Notes:</strong> ${order.notes}</p>` : ''}
    </div>
  `;
}

export async function sendOrderConfirmationEmails(reference: string): Promise<void> {
  const order = await getOrderForEmail(reference);
  if (!order) {
    console.error(`Could not load order ${reference} for email`);
    return;
  }

  const fromAddr = 'Spearings Butchers <orders@spearings.co.uk>';

  try {
    console.log(`[email] Sending to customer: ${order.customer_email}`);
    console.log(`[email] Sending to shop: ${notificationEmail}`);
    console.log(`[email] Resend API key: ${getEnv('RESEND_API_KEY').slice(0, 8)}...`);

    const [customerResult, shopResult] = await Promise.all([
      resend.emails.send({
        from: fromAddr,
        replyTo: 'pies@spearings.co.uk',
        to: [order.customer_email],
        subject: `Your Spearings order ${order.reference}`,
        html: buildCustomerEmailHtml(order),
      }),
      resend.emails.send({
        from: fromAddr,
        replyTo: order.customer_email,
        to: [notificationEmail],
        subject: `New Order: ${order.reference} — ${order.customer_name}`,
        html: buildShopNotificationHtml(order),
      }),
    ]);
    console.log(`[email] Customer result:`, JSON.stringify(customerResult));
    console.log(`[email] Shop result:`, JSON.stringify(shopResult));
  } catch (err) {
    console.error('[email] Sending failed:', err);
  }
}
