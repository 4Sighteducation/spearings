import type { APIRoute } from 'astro';
import { getAdminFromRequest } from '../../../lib/admin-auth';
import { supabaseAdmin } from '../../../lib/supabase-server';

export const POST: APIRoute = async ({ request }) => {
  const admin = getAdminFromRequest(request);
  if (!admin) return new Response('Unauthorized', { status: 401 });

  const { from, to, reason } = await request.json();
  if (!from) return new Response(JSON.stringify({ error: 'Missing from date' }), { status: 400 });

  const endDate = to || from;
  const dates: { blocked_date: string; reason: string }[] = [];
  const current = new Date(from + 'T12:00:00');
  const end = new Date(endDate + 'T12:00:00');

  while (current <= end) {
    dates.push({
      blocked_date: current.toISOString().slice(0, 10),
      reason: reason || 'Blocked by admin',
    });
    current.setDate(current.getDate() + 1);
  }

  const { error } = await supabaseAdmin
    .from('order_dates_blocked')
    .upsert(dates, { onConflict: 'blocked_date' });

  if (error) return new Response(JSON.stringify({ error: error.message }), { status: 500 });
  return new Response(JSON.stringify({ ok: true, count: dates.length }));
};

export const DELETE: APIRoute = async ({ request }) => {
  const admin = getAdminFromRequest(request);
  if (!admin) return new Response('Unauthorized', { status: 401 });

  const { id } = await request.json();
  if (!id) return new Response(JSON.stringify({ error: 'Missing id' }), { status: 400 });

  const { error } = await supabaseAdmin.from('order_dates_blocked').delete().eq('id', id);
  if (error) return new Response(JSON.stringify({ error: error.message }), { status: 500 });
  return new Response(JSON.stringify({ ok: true }));
};
