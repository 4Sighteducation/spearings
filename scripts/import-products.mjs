import fs from 'node:fs/promises';
import path from 'node:path';
import { parse } from 'csv-parse/sync';

const projectRoot = process.cwd();
const sourceCsvPath = path.resolve(
  projectRoot,
  '..',
  '..',
  'Spearings - Spearings Products - 65aac0c230244b51ed39bd17.csv',
);
const outputDir = path.join(projectRoot, 'data');
const seedPath = path.join(projectRoot, 'supabase', 'seed.sql');

const categoryOrder = ['meat', 'pies', 'deli', 'cheese'];

function toSlug(value) {
  return String(value ?? '')
    .normalize('NFKD')
    .replace(/[^\w\s-]/g, '')
    .trim()
    .toLowerCase()
    .replace(/[\s_-]+/g, '-')
    .replace(/^-+|-+$/g, '');
}

function cleanText(value) {
  return String(value ?? '')
    .replace(/<[^>]*>/g, ' ')
    .replace(/&amp;/g, '&')
    .replace(/&quot;/g, '"')
    .replace(/&#x27;/g, "'")
    .replace(/&nbsp;/g, ' ')
    .replace(/\uFFFD/g, "'")
    .replace(/\u200D/g, ' ')
    .replace(/\s+/g, ' ')
    .trim();
}

function parseBoolean(value) {
  return String(value).trim().toUpperCase() === 'TRUE';
}

function parseDate(value) {
  if (!value || !String(value).trim()) return null;
  const parsed = new Date(value);
  return Number.isNaN(parsed.valueOf()) ? null : parsed.toISOString();
}

function parsePrice(value) {
  if (value === undefined || value === null || value === '') return null;
  const parsed = Number(value);
  return Number.isFinite(parsed) ? parsed : null;
}

function mapPriceType(value) {
  const normalized = String(value ?? '').trim().toLowerCase();
  if (normalized === 'by weight') return 'by_weight';
  if (normalized === 'by count') return 'by_count';
  return 'other';
}

function sqlValue(value) {
  if (value === null || value === undefined) return 'null';
  if (typeof value === 'boolean') return value ? 'true' : 'false';
  if (typeof value === 'number') return Number.isFinite(value) ? String(value) : 'null';
  return `'${String(value).replace(/'/g, "''")}'`;
}

const csvContents = await fs.readFile(sourceCsvPath, 'utf8');
const rows = parse(csvContents, {
  columns: true,
  skip_empty_lines: true,
  relax_column_count: true,
});

const categories = [];
const categoryMap = new Map();
const subcategories = [];
const subcategoryMap = new Map();

for (const row of rows) {
  const categorySlug = toSlug(row['Product Category']);
  if (!categorySlug) continue;

  if (!categoryMap.has(categorySlug)) {
    const category = {
      slug: categorySlug,
      name: cleanText(row['Product Category']).replace(/\b\w/g, (char) => char.toUpperCase()),
      sortOrder: categoryOrder.indexOf(categorySlug) >= 0 ? categoryOrder.indexOf(categorySlug) : categories.length,
    };
    categories.push(category);
    categoryMap.set(categorySlug, category);
  }

  const subcategoryName = cleanText(row['Sub-Category']);
  if (subcategoryName) {
    const subcategorySlug = `${categorySlug}-${toSlug(subcategoryName)}`;
    if (!subcategoryMap.has(subcategorySlug)) {
      const subcategory = {
        slug: subcategorySlug,
        name: subcategoryName,
        categorySlug,
        sortOrder: subcategories.filter((item) => item.categorySlug === categorySlug).length,
      };
      subcategories.push(subcategory);
      subcategoryMap.set(subcategorySlug, subcategory);
    }
  }
}

const products = rows.map((row) => {
  const categorySlug = toSlug(row['Product Category']);
  const subcategoryName = cleanText(row['Sub-Category']);
  const subcategorySlug = subcategoryName ? `${categorySlug}-${toSlug(subcategoryName)}` : null;
  const shortDescription = cleanText(row['Product Description']) || cleanText(row['Description']);

  return {
    legacyCollectionId: row['Collection ID'] || null,
    legacyItemId: row['Item ID'] || null,
    name: cleanText(row['Name']),
    slug: toSlug(row['Slug'] || row['Name']),
    categorySlug,
    subcategorySlug,
    price: parsePrice(row['Price']),
    priceType: mapPriceType(row['Product Type']),
    size: cleanText(row['Size']) || null,
    inventory: cleanText(row['Inventory']) || null,
    shortDescription: shortDescription || null,
    descriptionHtml: row['Description'] || null,
    sourceProductDescription: cleanText(row['Product Description']) || null,
    sourceImageUrl: cleanText(row['Image']) || null,
    orderOnPage: row['Order on Page'] ? Number(row['Order on Page']) : null,
    isArchived: parseBoolean(row['Archived']),
    isDraft: parseBoolean(row['Draft']),
    publishedAt: parseDate(row['Published On']),
    sourceCreatedAt: parseDate(row['Created On']),
    sourceUpdatedAt: parseDate(row['Updated On']),
  };
});

const images = products
  .filter((product) => product.sourceImageUrl)
  .map((product) => ({
    productSlug: product.slug,
    sourceUrl: product.sourceImageUrl,
    altText: product.name,
    isPrimary: true,
    sortOrder: 0,
  }));

await fs.mkdir(outputDir, { recursive: true });
await fs.writeFile(
  path.join(outputDir, 'catalog.json'),
  JSON.stringify({ categories, subcategories, products, images }, null, 2),
);

const seedSql = `begin;

delete from public.product_images;
delete from public.products;
delete from public.subcategories;
delete from public.categories;

${categories
  .map(
    (category) => `insert into public.categories (name, slug, sort_order)
values (${sqlValue(category.name)}, ${sqlValue(category.slug)}, ${sqlValue(category.sortOrder)});`,
  )
  .join('\n\n')}

${subcategories
  .map(
    (subcategory) => `insert into public.subcategories (category_id, name, slug, sort_order)
values (
  (select id from public.categories where slug = ${sqlValue(subcategory.categorySlug)}),
  ${sqlValue(subcategory.name)},
  ${sqlValue(subcategory.slug)},
  ${sqlValue(subcategory.sortOrder)}
);`,
  )
  .join('\n\n')}

${products
  .map(
    (product) => `insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  ${sqlValue(product.legacyCollectionId)},
  ${sqlValue(product.legacyItemId)},
  ${sqlValue(product.name)},
  ${sqlValue(product.slug)},
  (select id from public.categories where slug = ${sqlValue(product.categorySlug)}),
  ${
    product.subcategorySlug
      ? `(select id from public.subcategories where slug = ${sqlValue(product.subcategorySlug)})`
      : 'null'
  },
  ${sqlValue(product.price)},
  ${sqlValue(product.priceType)},
  ${sqlValue(product.size)},
  ${sqlValue(product.inventory)},
  ${sqlValue(product.shortDescription)},
  ${sqlValue(product.descriptionHtml)},
  ${sqlValue(product.sourceProductDescription)},
  ${sqlValue(product.sourceImageUrl)},
  ${sqlValue(product.orderOnPage)},
  ${sqlValue(product.isArchived)},
  ${sqlValue(product.isDraft)},
  ${sqlValue(product.publishedAt)},
  ${sqlValue(product.sourceCreatedAt)},
  ${sqlValue(product.sourceUpdatedAt)}
);`,
  )
  .join('\n\n')}

${images
  .map(
    (image) => `insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = ${sqlValue(image.productSlug)}),
  ${sqlValue(image.sourceUrl)},
  ${sqlValue(image.altText)},
  ${sqlValue(image.isPrimary)},
  ${sqlValue(image.sortOrder)}
);`,
  )
  .join('\n\n')}

commit;
`;

await fs.writeFile(seedPath, seedSql);

console.log(`Imported ${products.length} products from CSV.`);
console.log(`Generated ${categories.length} categories and ${subcategories.length} subcategories.`);
console.log(`Wrote ${path.relative(projectRoot, seedPath)} and data/catalog.json.`);
