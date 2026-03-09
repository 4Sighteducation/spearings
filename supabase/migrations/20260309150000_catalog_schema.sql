create extension if not exists pgcrypto;

create table if not exists public.categories (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  slug text not null unique,
  sort_order integer not null default 0,
  created_at timestamptz not null default timezone('utc', now())
);

create table if not exists public.subcategories (
  id uuid primary key default gen_random_uuid(),
  category_id uuid not null references public.categories(id) on delete cascade,
  name text not null,
  slug text not null unique,
  sort_order integer not null default 0,
  created_at timestamptz not null default timezone('utc', now())
);

create table if not exists public.products (
  id uuid primary key default gen_random_uuid(),
  legacy_collection_id text,
  legacy_item_id text unique,
  name text not null,
  slug text not null unique,
  category_id uuid not null references public.categories(id) on delete restrict,
  subcategory_id uuid references public.subcategories(id) on delete set null,
  price numeric(10, 2),
  price_type text not null default 'other' check (price_type in ('by_weight', 'by_count', 'other')),
  size text,
  inventory text,
  short_description text,
  description_html text,
  source_product_description text,
  source_image_url text,
  order_on_page integer,
  is_archived boolean not null default false,
  is_draft boolean not null default false,
  published_at timestamptz,
  source_created_at timestamptz,
  source_updated_at timestamptz,
  created_at timestamptz not null default timezone('utc', now()),
  updated_at timestamptz not null default timezone('utc', now())
);

create table if not exists public.product_images (
  id uuid primary key default gen_random_uuid(),
  product_id uuid not null references public.products(id) on delete cascade,
  source_url text not null,
  alt_text text,
  is_primary boolean not null default true,
  sort_order integer not null default 0,
  created_at timestamptz not null default timezone('utc', now())
);

create index if not exists idx_subcategories_category_id on public.subcategories(category_id);
create index if not exists idx_products_category_id on public.products(category_id);
create index if not exists idx_products_subcategory_id on public.products(subcategory_id);
create index if not exists idx_product_images_product_id on public.product_images(product_id);

create or replace function public.set_updated_at()
returns trigger
language plpgsql
as $$
begin
  new.updated_at = timezone('utc', now());
  return new;
end;
$$;

drop trigger if exists products_set_updated_at on public.products;
create trigger products_set_updated_at
before update on public.products
for each row
execute function public.set_updated_at();
