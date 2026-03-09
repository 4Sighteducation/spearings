import fs from 'node:fs/promises';
import path from 'node:path';

const projectRoot = process.cwd();
const catalogPath = path.join(projectRoot, 'data', 'catalog.json');
const imagesDir = path.resolve(projectRoot, '..', '..', 'images');
const outputPath = path.join(projectRoot, 'data', 'image-match-report.json');

const imageExtensions = new Set(['.jpg', '.jpeg', '.png', '.webp', '.gif', '.svg']);

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

function stripExtension(value) {
  return value.replace(/\.[^.]+$/, '');
}

function stripResponsiveSuffix(value) {
  return value.replace(/-p-\d+$/i, '');
}

function stripHashPrefixes(value) {
  let current = value;
  while (/^[a-f0-9]{8,}_/i.test(current)) {
    current = current.replace(/^[a-f0-9]{8,}_/i, '');
  }
  return current;
}

function normalizeName(value) {
  return safeDecode(String(value ?? ''))
    .normalize('NFKD')
    .replace(/\uFFFD/g, "'")
    .replace(/[^\w\s.-]/g, '')
    .trim()
    .toLowerCase()
    .replace(/[\s._-]+/g, '-')
    .replace(/^-+|-+$/g, '');
}

function buildKeys(filename) {
  const decoded = safeDecode(filename);
  const noExt = stripExtension(decoded);
  const noResponsive = stripResponsiveSuffix(noExt);
  const noHash = stripHashPrefixes(noResponsive);

  return Array.from(
    new Set([
      normalizeName(decoded),
      normalizeName(noExt),
      normalizeName(noResponsive),
      normalizeName(noHash),
    ].filter(Boolean)),
  );
}

async function walkFiles(targetDir) {
  const entries = await fs.readdir(targetDir, { withFileTypes: true });
  const results = [];

  for (const entry of entries) {
    const absolutePath = path.join(targetDir, entry.name);
    if (entry.isDirectory()) {
      results.push(...(await walkFiles(absolutePath)));
      continue;
    }

    const extension = path.extname(entry.name).toLowerCase();
    if (imageExtensions.has(extension)) {
      results.push(absolutePath);
    }
  }

  return results;
}

const catalog = JSON.parse(await fs.readFile(catalogPath, 'utf8'));
const imageFiles = await walkFiles(imagesDir);

const fileRecords = imageFiles.map((absolutePath) => {
  const relativePath = path.relative(projectRoot, absolutePath).replaceAll('\\', '/');
  const filename = path.basename(absolutePath);
  const keys = buildKeys(filename);
  const isResponsiveVariant = /-p-\d+\.[^.]+$/i.test(filename);

  return {
    absolutePath,
    relativePath,
    filename,
    keys,
    isResponsiveVariant,
  };
});

const keyToFiles = new Map();

for (const fileRecord of fileRecords) {
  for (const key of fileRecord.keys) {
    const list = keyToFiles.get(key) ?? [];
    list.push(fileRecord);
    keyToFiles.set(key, list);
  }
}

function rankCandidates(candidates) {
  return [...candidates].sort((a, b) => {
    if (a.isResponsiveVariant !== b.isResponsiveVariant) {
      return Number(a.isResponsiveVariant) - Number(b.isResponsiveVariant);
    }

    return a.filename.length - b.filename.length;
  });
}

const productMatches = catalog.products.map((product) => {
  const sourceUrl = product.sourceImageUrl;
  if (!sourceUrl) {
    return {
      productSlug: product.slug,
      productName: product.name,
      sourceImageUrl: null,
      status: 'missing_source_url',
      matchedFile: null,
      candidates: [],
    };
  }

  const sourceFilename = path.basename(safeDecode(sourceUrl));
  const keys = buildKeys(sourceFilename);
  const candidates = rankCandidates(
    Array.from(new Set(keys.flatMap((key) => keyToFiles.get(key) ?? []))),
  );

  const matchedFile = candidates[0] ?? null;

  return {
    productSlug: product.slug,
    productName: product.name,
    sourceImageUrl: sourceUrl,
    sourceFilename,
    status: matchedFile ? 'matched_local_file' : 'unmatched',
    matchedFile: matchedFile
      ? {
          relativePath: matchedFile.relativePath,
          filename: matchedFile.filename,
        }
      : null,
    candidates: candidates.slice(0, 5).map((candidate) => ({
      relativePath: candidate.relativePath,
      filename: candidate.filename,
    })),
  };
});

const summary = {
  totalProducts: productMatches.length,
  withSourceImageUrl: productMatches.filter((item) => item.sourceImageUrl).length,
  matchedLocalFile: productMatches.filter((item) => item.status === 'matched_local_file').length,
  unmatched: productMatches.filter((item) => item.status === 'unmatched').length,
  missingSourceUrl: productMatches.filter((item) => item.status === 'missing_source_url').length,
  totalLocalImageFiles: fileRecords.length,
};

await fs.writeFile(outputPath, JSON.stringify({ summary, productMatches }, null, 2));

console.log(`Scanned ${fileRecords.length} local image files.`);
console.log(
  `Matched ${summary.matchedLocalFile} of ${summary.withSourceImageUrl} product images; ${summary.unmatched} remain unmatched.`,
);
console.log(`Wrote ${path.relative(projectRoot, outputPath)}.`);
