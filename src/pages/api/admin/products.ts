import type { APIRoute } from 'astro';
import { getAdminFromRequest } from '../../../lib/admin-auth';
import { supabaseAdmin } from '../../../lib/supabase-server';

export const PATCH: APIRoute = async ({ request }) => {
  const admin = getAdminFromRequest(request);
  if (!admin) return new Response('Unauthorized', { status: 401 });

  const body = await request.json();
  const { id, ...updates } = body;
  if (!id) return new Response(JSON.stringify({ error: 'Missing id' }), { status: 400 });

  const allowed: Record<string, any> = {};
  if (updates.price !== undefined) allowed.price = updates.price;
  if (updates.name !== undefined) allowed.name = updates.name;
  if (updates.short_description !== undefined) allowed.short_description = updates.short_description;
  if (updates.size !== undefined) allowed.size = updates.size;
  if (updates.is_draft !== undefined) allowed.is_draft = updates.is_draft;
  if (updates.is_archived !== undefined) allowed.is_archived = updates.is_archived;

  if (Object.keys(allowed).length === 0) {
    return new Response(JSON.stringify({ error: 'No valid fields' }), { status: 400 });
  }

  const { error } = await supabaseAdmin.from('products').update(allowed).eq('id', id);
  if (error) return new Response(JSON.stringify({ error: error.message }), { status: 500 });
  return new Response(JSON.stringify({ ok: true }));
};
