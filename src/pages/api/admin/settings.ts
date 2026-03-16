import type { APIRoute } from 'astro';
import { getAdminFromRequest } from '../../../lib/admin-auth';
import { supabaseAdmin } from '../../../lib/supabase-server';

export const PUT: APIRoute = async ({ request }) => {
  const admin = getAdminFromRequest(request);
  if (!admin) return new Response('Unauthorized', { status: 401 });

  const updates = await request.json();
  const validKeys = [
    'orders_enabled', 'collection_only', 'min_lead_days',
    'closed_weekdays', 'delivery_fee_pence', 'free_delivery_threshold_pence',
    'max_order_items',
  ];

  const rows = Object.entries(updates)
    .filter(([key]) => validKeys.includes(key))
    .map(([key, value]) => ({ key, value: String(value), updated_at: new Date().toISOString() }));

  if (rows.length === 0) {
    return new Response(JSON.stringify({ error: 'No valid settings' }), { status: 400 });
  }

  const { error } = await supabaseAdmin
    .from('order_settings')
    .upsert(rows, { onConflict: 'key' });

  if (error) return new Response(JSON.stringify({ error: error.message }), { status: 500 });
  return new Response(JSON.stringify({ ok: true }));
};
