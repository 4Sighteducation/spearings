import type { APIRoute } from 'astro';
import { supabaseAdmin } from '../../lib/supabase-server';

export const GET: APIRoute = async ({ url }) => {
  const email = url.searchParams.get('email')?.toLowerCase().trim();
  const ref = url.searchParams.get('ref')?.toUpperCase().trim();

  if (!email || !ref) {
    return json({ error: 'Email and reference are required' }, 400);
  }

  const { data, error } = await supabaseAdmin
    .from('orders')
    .select(`
      reference, status, order_type, delivery_date,
      subtotal, shipping, total, created_at, confirmed_at,
      order_items ( product_name, quantity, unit_price, line_total )
    `)
    .eq('reference', ref)
    .eq('customer_email', email)
    .single();

  if (error || !data) {
    return json({ error: 'Order not found' }, 404);
  }

  return json({ order: data });
};

function json(data: any, status = 200) {
  return new Response(JSON.stringify(data), {
    status,
    headers: { 'Content-Type': 'application/json' },
  });
}
