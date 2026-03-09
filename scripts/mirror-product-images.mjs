import fs from 'node:fs/promises';
import path from 'node:path';

const projectRoot = process.cwd();
const catalogPath = path.join(projectRoot, 'data', 'catalog.json');
const outputDir = path.join(projectRoot, 'public', 'product-images');
const reportPath = path.join(projectRoot, 'data', 'product-image-mirror-report.json');
const updateSqlPath = path.join(projectRoot, 'supabase', 'update-product-image-paths.sql');

function safeDecode(value) {
  let current = value;
  for (let i = 0; i < 3; i += 1) {
    try {
      const decoded = decodeURIComponent(current);
      if (decoded === current) return decoded;
      current = decoded;
    } catch {
      return current;
    }
  }
  return current;
}

function inferExtension(sourceUrl, contentType) {
  const pathname = new URL(sourceUrl).pathname;
  const extensionFromUrl = path.extname(safeDecode(pathname)).toLowerCase();
  if (extensionFromUrl) return extensionFromUrl;

  const type = String(contentType ?? '').toLowerCase();
  if (type.includes('png')) return '.png';
  if (type.includes('webp')) return '.webp';
  if (type.includes('gif')) return '.gif';
  if (type.includes('svg')) return '.svg';
  return '.jpg';
}

function sqlValue(value) {
  if (value === null || value === undefined) return 'null';
  return `'${String(value).replace(/'/g, "''")}'`;
}

const catalog = JSON.parse(await fs.readFile(catalogPath, 'utf8'));
await fs.mkdir(outputDir, { recursive: true });

const results = [];

for (const product of catalog.products) {
  if (!product.sourceImageUrl) {
    results.push({
      productSlug: product.slug,
      productName: product.name,
      sourceImageUrl: null,
      status: 'missing_source_url',
      localPath: null,
      error: null,
    });
    continue;
  }

  try {
    const response = await fetch(product.sourceImageUrl);
    if (!response.ok) {
      results.push({
        productSlug: product.slug,
        productName: product.name,
        sourceImageUrl: product.sourceImageUrl,
        status: 'failed',
        localPath: null,
        error: `HTTP ${response.status}`,
      });
      continue;
    }

    const extension = inferExtension(product.sourceImageUrl, response.headers.get('content-type'));
    const localFilename = `${product.slug}${extension}`;
    const localAbsolutePath = path.join(outputDir, localFilename);
    const localPath = `/product-images/${localFilename}`;
    const arrayBuffer = await response.arrayBuffer();

    await fs.writeFile(localAbsolutePath, Buffer.from(arrayBuffer));

    results.push({
      productSlug: product.slug,
      productName: product.name,
      sourceImageUrl: product.sourceImageUrl,
      status: 'downloaded',
      localPath,
      error: null,
    });
  } catch (error) {
    results.push({
      productSlug: product.slug,
      productName: product.name,
      sourceImageUrl: product.sourceImageUrl,
      status: 'failed',
      localPath: null,
      error: error instanceof Error ? error.message : String(error),
    });
  }
}

const summary = {
  totalProducts: results.length,
  downloaded: results.filter((item) => item.status === 'downloaded').length,
  failed: results.filter((item) => item.status === 'failed').length,
  missingSourceUrl: results.filter((item) => item.status === 'missing_source_url').length,
};

await fs.writeFile(reportPath, JSON.stringify({ summary, results }, null, 2));

const updateSql = `begin;

${results
  .filter((item) => item.status === 'downloaded' && item.localPath)
  .map(
    (item) => `update public.product_images
set local_path = ${sqlValue(item.localPath)}
where product_id = (select id from public.products where slug = ${sqlValue(item.productSlug)});`,
  )
  .join('\n\n')}

commit;
`;

await fs.writeFile(updateSqlPath, updateSql);

console.log(
  `Downloaded ${summary.downloaded} product images, ${summary.failed} failed, ${summary.missingSourceUrl} had no source URL.`,
);
console.log(`Wrote ${path.relative(projectRoot, reportPath)} and ${path.relative(projectRoot, updateSqlPath)}.`);
