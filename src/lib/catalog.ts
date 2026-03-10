import rawCatalog from '../../data/catalog.json';
import { hasSupabaseConfig, supabase } from './supabase';

export interface Category {
  slug: string;
  name: string;
  sortOrder: number;
}

export interface Subcategory {
  slug: string;
  name: string;
  categorySlug: string;
  sortOrder: number;
}

export interface Product {
  slug: string;
  name: string;
  categorySlug: string;
  subcategorySlug: string | null;
  price: number | null;
  priceType: 'by_weight' | 'by_count' | 'other';
  size: string | null;
  shortDescription: string | null;
  sourceImageUrl: string | null;
  imageUrl: string | null;
  isDraft: boolean;
  isArchived: boolean;
}

interface RawCatalog {
  categories: Category[];
  subcategories: Subcategory[];
  products: Array<{
    slug: string;
    name: string;
    categorySlug: string;
    subcategorySlug: string | null;
    price: number | null;
    priceType: 'by_weight' | 'by_count' | 'other';
    size: string | null;
    shortDescription: string | null;
    sourceImageUrl: string | null;
    isDraft: boolean;
    isArchived: boolean;
  }>;
}

function inferLocalImagePath(product: { slug: string; sourceImageUrl: string | null }) {
  if (!product.sourceImageUrl) return null;

  try {
    const pathname = new URL(product.sourceImageUrl).pathname;
    const extension = pathname.match(/\.[a-zA-Z0-9]+$/)?.[0] ?? '.jpg';
    return `/product-images/${product.slug}${extension.toLowerCase()}`;
  } catch {
    return `/product-images/${product.slug}.jpg`;
  }
}

function normalizeLocalCatalog(): {
  categories: Category[];
  subcategories: Subcategory[];
  products: Product[];
} {
  const catalog = rawCatalog as RawCatalog;

  return {
    categories: [...catalog.categories].sort((a, b) => a.sortOrder - b.sortOrder),
    subcategories: [...catalog.subcategories].sort((a, b) => a.sortOrder - b.sortOrder),
    products: catalog.products
      .map((product) => ({
        ...product,
        imageUrl: inferLocalImagePath(product),
      }))
      .filter((product) => !product.isArchived && !product.isDraft),
  };
}

export async function getCatalog() {
  if (!hasSupabaseConfig() || !supabase) {
    return normalizeLocalCatalog();
  }

  try {
    const [categoriesResult, subcategoriesResult, productsResult, imagesResult] = await Promise.all([
      supabase.from('categories').select('name, slug, sort_order').order('sort_order'),
      supabase
        .from('subcategories')
        .select('name, slug, sort_order, category_id, categories!inner(slug)')
        .order('sort_order'),
      supabase
        .from('products')
        .select(
          'slug, name, price, price_type, size, short_description, source_image_url, is_draft, is_archived, categories!inner(slug), subcategories(slug)',
        )
        .eq('is_archived', false)
        .eq('is_draft', false)
        .order('name'),
      supabase.from('product_images').select('local_path, source_url, product_id, products!inner(slug)'),
    ]);

    if (
      categoriesResult.error ||
      subcategoriesResult.error ||
      productsResult.error ||
      imagesResult.error
    ) {
      throw (
        categoriesResult.error ||
        subcategoriesResult.error ||
        productsResult.error ||
        imagesResult.error
      );
    }

    const imageMap = new Map<string, { local_path: string | null; source_url: string | null }>();

    for (const row of imagesResult.data ?? []) {
      const productSlug = row.products?.slug;
      if (!productSlug || imageMap.has(productSlug)) continue;
      imageMap.set(productSlug, {
        local_path: row.local_path,
        source_url: row.source_url,
      });
    }

    const remoteCatalog = {
      categories:
        categoriesResult.data?.map((row) => ({
          name: row.name,
          slug: row.slug,
          sortOrder: row.sort_order ?? 0,
        })) ?? [],
      subcategories:
        subcategoriesResult.data?.map((row) => ({
          name: row.name,
          slug: row.slug,
          sortOrder: row.sort_order ?? 0,
          categorySlug: row.categories?.slug ?? '',
        })) ?? [],
      products:
        productsResult.data?.map((row) => {
          const image = imageMap.get(row.slug);
          return {
            slug: row.slug,
            name: row.name,
            categorySlug: row.categories?.slug ?? '',
            subcategorySlug: row.subcategories?.slug ?? null,
            price: row.price,
            priceType: row.price_type,
            size: row.size,
            shortDescription: row.short_description,
            sourceImageUrl: row.source_image_url,
            imageUrl: image?.local_path || image?.source_url || inferLocalImagePath({
              slug: row.slug,
              sourceImageUrl: row.source_image_url,
            }),
            isDraft: row.is_draft,
            isArchived: row.is_archived,
          } satisfies Product;
        }) ?? [],
    };

    if (remoteCatalog.categories.length === 0 || remoteCatalog.products.length === 0) {
      return normalizeLocalCatalog();
    }

    return remoteCatalog;
  } catch {
    return normalizeLocalCatalog();
  }
}

export function getProductsByCategory(products: Product[], categorySlug: string) {
  return products.filter((product) => product.categorySlug === categorySlug);
}

export function isOnlineOrderable(product: Product) {
  return product.categorySlug === 'pies';
}

export function formatPrice(product: Product) {
  if (product.price === null || product.price === undefined) {
    return 'Ask in shop';
  }

  const base = `£${product.price.toFixed(2)}`;
  if (product.priceType === 'by_weight') return `${base} per lb`;
  if (product.priceType === 'by_count') return `${base} each`;
  return base;
}
