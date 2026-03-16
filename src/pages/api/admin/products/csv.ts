import type { APIRoute } from 'astro';
import { getAdminFromRequest } from '../../../../lib/admin-auth';
import { supabaseAdmin } from '../../../../lib/supabase-server';

function parseCsvLine(line: string): string[] {
  const result: string[] = [];
  let current = '';
  let inQuotes = false;

  for (let i = 0; i < line.length; i++) {
    const ch = line[i];
    if (inQuotes) {
      if (ch === '"' && line[i + 1] === '"') { current += '"'; i++; }
      else if (ch === '"') inQuotes = false;
      else current += ch;
    } else {
      if (ch === '"') inQuotes = true;
      else if (ch === ',') { result.push(current.trim()); current = ''; }
      else current += ch;
    }
  }
  result.push(current.trim());
  return result;
}

export const POST: APIRoute = async ({ request }) => {
  const admin = getAdminFromRequest(request);
  if (!admin) return new Response('Unauthorized', { status: 401 });

  try {
    const text = await request.text();
    const lines = text.split(/\r?\n/).filter((l) => l.trim());
    if (lines.length < 2) {
      return new Response(JSON.stringify({ error: 'CSV must have headers and at least one row' }), { status: 400 });
    }

    const headers = parseCsvLine(lines[0]).map((h) => h.toLowerCase().replace(/\s+/g, '_'));
    const slugIdx = headers.indexOf('slug');
    const nameIdx = headers.indexOf('name');
    const categoryIdx = headers.indexOf('category');
    const priceIdx = headers.indexOf('price');
    const sizeIdx = headers.indexOf('size');
    const priceTypeIdx = headers.indexOf('price_type');
    const descIdx = headers.indexOf('short_description');

    if (slugIdx === -1) {
      return new Response(JSON.stringify({ error: 'CSV must have a "slug" column' }), { status: 400 });
    }

    // Load existing products and categories for matching
    const [{ data: existingProducts }, { data: existingCategories }] = await Promise.all([
      supabaseAdmin.from('products').select('id, slug'),
      supabaseAdmin.from('categories').select('id, slug'),
    ]);

    const productMap = new Map((existingProducts ?? []).map((p: any) => [p.slug, p.id]));
    const categoryMap = new Map((existingCategories ?? []).map((c: any) => [c.slug, c.id]));

    let updated = 0;
    let created = 0;
    let errors: string[] = [];

    for (let i = 1; i < lines.length; i++) {
      const cols = parseCsvLine(lines[i]);
      const slug = cols[slugIdx];
      if (!slug) continue;

      const price = priceIdx >= 0 ? parseFloat(cols[priceIdx]) : null;
      const existingId = productMap.get(slug);

      if (existingId) {
        // Update existing product
        const updates: Record<string, any> = {};
        if (priceIdx >= 0 && !isNaN(price!)) updates.price = price;
        if (nameIdx >= 0 && cols[nameIdx]) updates.name = cols[nameIdx];
        if (sizeIdx >= 0 && cols[sizeIdx]) updates.size = cols[sizeIdx];
        if (priceTypeIdx >= 0 && cols[priceTypeIdx]) updates.price_type = cols[priceTypeIdx];
        if (descIdx >= 0 && cols[descIdx]) updates.short_description = cols[descIdx];

        if (Object.keys(updates).length > 0) {
          const { error } = await supabaseAdmin.from('products').update(updates).eq('id', existingId);
          if (error) errors.push(`Row ${i + 1} (${slug}): ${error.message}`);
          else updated++;
        }
      } else {
        // Create new product
        const name = nameIdx >= 0 ? cols[nameIdx] : slug;
        const catSlug = categoryIdx >= 0 ? cols[categoryIdx] : '';
        const categoryId = categoryMap.get(catSlug) ?? null;

        const row: Record<string, any> = {
          slug,
          name: name || slug,
          category_id: categoryId,
          price: priceIdx >= 0 && !isNaN(price!) ? price : null,
          price_type: priceTypeIdx >= 0 && cols[priceTypeIdx] ? cols[priceTypeIdx] : 'by_count',
          size: sizeIdx >= 0 ? cols[sizeIdx] || null : null,
          short_description: descIdx >= 0 ? cols[descIdx] || null : null,
        };

        const { error } = await supabaseAdmin.from('products').insert(row);
        if (error) errors.push(`Row ${i + 1} (${slug}): ${error.message}`);
        else created++;
      }
    }

    return new Response(JSON.stringify({
      ok: true,
      updated,
      created,
      errors: errors.length > 0 ? errors : undefined,
    }));
  } catch (err: any) {
    return new Response(JSON.stringify({ error: err.message }), { status: 500 });
  }
};
