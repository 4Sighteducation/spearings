/**
 * Seeds the Supabase products table from catalog.json.
 * Run after creating tables: node scripts/seed-products.mjs
 */
import { readFileSync } from 'fs';
import { resolve } from 'path';
import { createClient } from '@supabase/supabase-js';

// Read .env manually
const envContent = readFileSync(resolve(process.cwd(), '.env'), 'utf8');
const env = {};
for (const line of envContent.split('\n')) {
  const trimmed = line.trim();
  if (!trimmed || trimmed.startsWith('#')) continue;
  const eq = trimmed.indexOf('=');
  if (eq === -1) continue;
  env[trimmed.slice(0, eq)] = trimmed.slice(eq + 1);
}

const supabase = createClient(env.PUBLIC_SUPABASE_URL, env.SUPABASE_SERVICE_ROLE_KEY, {
  auth: { persistSession: false },
});

const catalog = JSON.parse(readFileSync(resolve(process.cwd(), 'data/catalog.json'), 'utf8'));

// Seed categories
console.log(`Seeding ${catalog.categories.length} categories...`);
for (const cat of catalog.categories) {
  const { error } = await supabase.from('categories').upsert({
    slug: cat.slug,
    name: cat.name,
    sort_order: cat.sortOrder ?? 0,
  }, { onConflict: 'slug' });
  if (error) console.error(`  Category ${cat.slug}:`, error.message);
}

// Get category IDs
const { data: dbCategories } = await supabase.from('categories').select('id, slug');
const catMap = new Map(dbCategories.map(c => [c.slug, c.id]));

// Seed subcategories
console.log(`Seeding ${catalog.subcategories.length} subcategories...`);
for (const sub of catalog.subcategories) {
  const categoryId = catMap.get(sub.categorySlug);
  if (!categoryId) { console.warn(`  Skipping ${sub.slug} — no category ${sub.categorySlug}`); continue; }
  const { error } = await supabase.from('subcategories').upsert({
    slug: sub.slug,
    name: sub.name,
    category_id: categoryId,
    sort_order: sub.sortOrder ?? 0,
  }, { onConflict: 'slug' });
  if (error) console.error(`  Subcategory ${sub.slug}:`, error.message);
}

// Get subcategory IDs
const { data: dbSubcats } = await supabase.from('subcategories').select('id, slug');
const subMap = new Map(dbSubcats.map(s => [s.slug, s.id]));

// Seed products
const products = catalog.products.filter(p => !p.isArchived);
console.log(`Seeding ${products.length} products...`);
let count = 0;
for (const prod of products) {
  const categoryId = catMap.get(prod.categorySlug) ?? null;
  const subcategoryId = subMap.get(prod.subcategorySlug) ?? null;

  const { error } = await supabase.from('products').upsert({
    slug: prod.slug,
    name: prod.name,
    category_id: categoryId,
    subcategory_id: subcategoryId,
    price: prod.price,
    price_type: prod.priceType ?? 'by_count',
    size: prod.size ?? null,
    short_description: prod.shortDescription ?? null,
    source_image_url: prod.sourceImageUrl ?? null,
    is_draft: prod.isDraft ?? false,
    is_archived: prod.isArchived ?? false,
    sort_order: 0,
  }, { onConflict: 'slug' });

  if (error) console.error(`  Product ${prod.slug}:`, error.message);
  else count++;
}

console.log(`Done! Seeded ${count} products.`);
