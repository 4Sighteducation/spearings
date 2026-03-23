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
  if (updates.price_type !== undefined) {
    const pt = String(updates.price_type).trim();
    if (!pt) return new Response(JSON.stringify({ error: 'Invalid price_type' }), { status: 400 });
    allowed.price_type = pt;
  }
  if (updates.category_id !== undefined) allowed.category_id = updates.category_id;
  if (updates.subcategory_id !== undefined) allowed.subcategory_id = updates.subcategory_id;
  if (updates.source_image_url !== undefined) {
    const v = updates.source_image_url;
    allowed.source_image_url = v === null || v === '' ? null : String(v).trim();
  }

  if (Object.keys(allowed).length === 0) {
    return new Response(JSON.stringify({ error: 'No valid fields' }), { status: 400 });
  }

  if (allowed.category_id !== undefined && allowed.subcategory_id === undefined) {
    const { data: prod } = await supabaseAdmin.from('products').select('subcategory_id').eq('id', id).maybeSingle();
    if (prod?.subcategory_id) {
      const { data: sub } = await supabaseAdmin
        .from('subcategories')
        .select('category_id')
        .eq('id', prod.subcategory_id)
        .maybeSingle();
      if (sub && sub.category_id !== allowed.category_id) {
        allowed.subcategory_id = null;
      }
    }
  }

  if (allowed.subcategory_id !== undefined && allowed.subcategory_id !== null) {
    let catId = allowed.category_id;
    if (catId === undefined) {
      const { data: row } = await supabaseAdmin.from('products').select('category_id').eq('id', id).maybeSingle();
      catId = row?.category_id ?? undefined;
    }
    if (catId) {
      const { data: sub, error: subErr } = await supabaseAdmin
        .from('subcategories')
        .select('category_id')
        .eq('id', allowed.subcategory_id)
        .maybeSingle();
      if (subErr) return new Response(JSON.stringify({ error: subErr.message }), { status: 500 });
      if (sub && sub.category_id !== catId) {
        return new Response(JSON.stringify({ error: 'Subcategory does not belong to the selected category' }), {
          status: 400,
        });
      }
    }
  }

  const { error } = await supabaseAdmin.from('products').update(allowed).eq('id', id);
  if (error) return new Response(JSON.stringify({ error: error.message }), { status: 500 });

  if (Object.prototype.hasOwnProperty.call(updates, 'source_image_url')) {
    const v =
      updates.source_image_url === null || updates.source_image_url === ''
        ? ''
        : String(updates.source_image_url).trim();
    if (v) {
      const { data: rows } = await supabaseAdmin
        .from('product_images')
        .select('id')
        .eq('product_id', id)
        .order('sort_order', { ascending: true })
        .limit(1);
      if (rows?.[0]) {
        const { error: imgErr } = await supabaseAdmin
          .from('product_images')
          .update({ local_path: null, source_url: v })
          .eq('id', rows[0].id);
        if (imgErr) return new Response(JSON.stringify({ error: imgErr.message }), { status: 500 });
      } else {
        const { error: insErr } = await supabaseAdmin.from('product_images').insert({ product_id: id, source_url: v });
        if (insErr) return new Response(JSON.stringify({ error: insErr.message }), { status: 500 });
      }
    }
  }

  return new Response(JSON.stringify({ ok: true }));
};
