-- Products table for admin management
-- Uses IF NOT EXISTS to avoid conflicts with any existing tables

CREATE TABLE IF NOT EXISTS categories (
  id          UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  slug        TEXT UNIQUE NOT NULL,
  name        TEXT NOT NULL,
  sort_order  INTEGER DEFAULT 0,
  created_at  TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS subcategories (
  id            UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  slug          TEXT UNIQUE NOT NULL,
  name          TEXT NOT NULL,
  category_id   UUID REFERENCES categories(id) ON DELETE CASCADE,
  sort_order    INTEGER DEFAULT 0,
  created_at    TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS products (
  id                  UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  slug                TEXT UNIQUE NOT NULL,
  name                TEXT NOT NULL,
  category_id         UUID REFERENCES categories(id),
  subcategory_id      UUID REFERENCES subcategories(id),
  price               NUMERIC(10,2),
  price_type          TEXT DEFAULT 'by_count',
  size                TEXT,
  short_description   TEXT,
  source_image_url    TEXT,
  is_draft            BOOLEAN DEFAULT false,
  is_archived         BOOLEAN DEFAULT false,
  sort_order          INTEGER DEFAULT 0,
  created_at          TIMESTAMPTZ DEFAULT now(),
  updated_at          TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE IF NOT EXISTS product_images (
  id          UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  product_id  UUID REFERENCES products(id) ON DELETE CASCADE,
  source_url  TEXT,
  local_path  TEXT,
  created_at  TIMESTAMPTZ DEFAULT now()
);

-- Auto-update updated_at on products
CREATE OR REPLACE FUNCTION update_products_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS trg_products_updated_at ON products;
CREATE TRIGGER trg_products_updated_at
  BEFORE UPDATE ON products
  FOR EACH ROW
  EXECUTE FUNCTION update_products_updated_at();

-- RLS
ALTER TABLE categories ENABLE ROW LEVEL SECURITY;
ALTER TABLE subcategories ENABLE ROW LEVEL SECURITY;
ALTER TABLE products ENABLE ROW LEVEL SECURITY;
ALTER TABLE product_images ENABLE ROW LEVEL SECURITY;

-- Public read access (needed for the storefront)
CREATE POLICY "Anyone can read categories" ON categories FOR SELECT USING (true);
CREATE POLICY "Anyone can read subcategories" ON subcategories FOR SELECT USING (true);
CREATE POLICY "Anyone can read products" ON products FOR SELECT USING (true);
CREATE POLICY "Anyone can read product images" ON product_images FOR SELECT USING (true);

-- Service role full access (used by admin panel)
CREATE POLICY "Service role manages categories" ON categories FOR ALL USING (auth.role() = 'service_role');
CREATE POLICY "Service role manages subcategories" ON subcategories FOR ALL USING (auth.role() = 'service_role');
CREATE POLICY "Service role manages products" ON products FOR ALL USING (auth.role() = 'service_role');
CREATE POLICY "Service role manages product images" ON product_images FOR ALL USING (auth.role() = 'service_role');

-- Admin write access for blocked dates and settings
DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_policies WHERE policyname = 'Service role manages blocked dates') THEN
    CREATE POLICY "Service role manages blocked dates"
      ON order_dates_blocked FOR ALL USING (auth.role() = 'service_role');
  END IF;
  IF NOT EXISTS (SELECT 1 FROM pg_policies WHERE policyname = 'Service role manages order settings') THEN
    CREATE POLICY "Service role manages order settings"
      ON order_settings FOR ALL USING (auth.role() = 'service_role');
  END IF;
END $$;
