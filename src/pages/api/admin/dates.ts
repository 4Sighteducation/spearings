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

export const PATCH: APIRoute = async ({ request }) => {
  const admin = getAdminFromRequest(request);
  if (!admin) return new Response('Unauthorized', { status: 401 });

  const body = await request.json();
  const { id, blocked_date, reason } = body;
  if (!id) return new Response(JSON.stringify({ error: 'Missing id' }), { status: 400 });

  const updates: Record<string, string> = {};
  if (blocked_date !== undefined) {
    if (typeof blocked_date !== 'string' || !/^\d{4}-\d{2}-\d{2}$/.test(blocked_date)) {
      return new Response(JSON.stringify({ error: 'Invalid blocked_date' }), { status: 400 });
    }
    updates.blocked_date = blocked_date;
  }
  if (reason !== undefined) {
    updates.reason = typeof reason === 'string' ? reason : '';
  }

  if (Object.keys(updates).length === 0) {
    return new Response(JSON.stringify({ error: 'Nothing to update' }), { status: 400 });
  }

  const { error } = await supabaseAdmin.from('order_dates_blocked').update(updates).eq('id', id);

  if (error) {
    const dup = error.message.includes('duplicate');
    const msg = dup ? 'That date is already blocked' : error.message;
    return new Response(JSON.stringify({ error: msg }), { status: dup ? 409 : 500 });
  }
  return new Response(JSON.stringify({ ok: true }), {
    status: 200,
    headers: { 'Content-Type': 'application/json' },
  });
};
