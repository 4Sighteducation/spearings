import type { APIRoute } from 'astro';
import { getAdminFromRequest } from '../../../lib/admin-auth';
import { supabaseAdmin } from '../../../lib/supabase-server';

export const PATCH: APIRoute = async ({ request }) => {
  const admin = getAdminFromRequest(request);
  if (!admin) return new Response('Unauthorized', { status: 401 });

  const { id, status } = await request.json();
  const validStatuses = ['pending', 'confirmed', 'preparing', 'ready', 'collected', 'delivered', 'cancelled', 'refunded'];
  if (!id || !validStatuses.includes(status)) {
    return new Response(JSON.stringify({ error: 'Invalid data' }), { status: 400 });
  }

  const { error } = await supabaseAdmin
    .from('orders')
    .update({ status, ...(status === 'confirmed' ? { confirmed_at: new Date().toISOString() } : {}) })
    .eq('id', id);

  if (error) return new Response(JSON.stringify({ error: error.message }), { status: 500 });
  return new Response(JSON.stringify({ ok: true }));
};
