-- Spearings Pie Ordering System
-- Migration: orders, order_items, order_dates_blocked, order_settings

-- Orders table (guest checkout, no user accounts)
CREATE TABLE IF NOT EXISTS orders (
  id            UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  reference     TEXT NOT NULL UNIQUE,
  status        TEXT NOT NULL DEFAULT 'pending',

  customer_name TEXT NOT NULL,
  customer_email TEXT NOT NULL,
  customer_phone TEXT,

  order_type    TEXT NOT NULL DEFAULT 'collection',
  delivery_address_line1 TEXT,
  delivery_address_line2 TEXT,
  delivery_city TEXT,
  delivery_postcode TEXT,
  delivery_date DATE NOT NULL,

  subtotal      INTEGER NOT NULL,
  shipping      INTEGER NOT NULL DEFAULT 0,
  total         INTEGER NOT NULL,

  stripe_payment_intent_id TEXT UNIQUE,
  stripe_client_secret TEXT,

  notes         TEXT,
  created_at    TIMESTAMPTZ DEFAULT now(),
  updated_at    TIMESTAMPTZ DEFAULT now(),
  confirmed_at  TIMESTAMPTZ,

  CONSTRAINT valid_order_status CHECK (status IN (
    'pending', 'confirmed', 'preparing', 'ready',
    'collected', 'delivered', 'cancelled', 'refunded'
  )),
  CONSTRAINT valid_order_type CHECK (order_type IN ('collection', 'delivery'))
);

CREATE INDEX IF NOT EXISTS idx_orders_email ON orders(customer_email);
CREATE INDEX IF NOT EXISTS idx_orders_reference ON orders(reference);
CREATE INDEX IF NOT EXISTS idx_orders_status ON orders(status);
CREATE INDEX IF NOT EXISTS idx_orders_delivery_date ON orders(delivery_date);

-- Order items (snapshots product data at time of order)
CREATE TABLE IF NOT EXISTS order_items (
  id          UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  order_id    UUID NOT NULL REFERENCES orders(id) ON DELETE CASCADE,
  product_slug TEXT NOT NULL,
  product_name TEXT NOT NULL,
  quantity    INTEGER NOT NULL CHECK (quantity > 0),
  unit_price  INTEGER NOT NULL,
  line_total  INTEGER NOT NULL,
  created_at  TIMESTAMPTZ DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_order_items_order ON order_items(order_id);

-- Blocked dates (replaces hardcoded JS date logic)
CREATE TABLE IF NOT EXISTS order_dates_blocked (
  id          UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  blocked_date DATE NOT NULL UNIQUE,
  reason      TEXT,
  created_at  TIMESTAMPTZ DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_blocked_dates ON order_dates_blocked(blocked_date);

-- Global order settings (admin-manageable, no code changes needed)
CREATE TABLE IF NOT EXISTS order_settings (
  key         TEXT PRIMARY KEY,
  value       TEXT NOT NULL,
  updated_at  TIMESTAMPTZ DEFAULT now()
);

INSERT INTO order_settings (key, value) VALUES
  ('min_lead_days', '2'),
  ('closed_weekdays', '0,1'),
  ('delivery_fee_pence', '500'),
  ('free_delivery_threshold_pence', '3000'),
  ('orders_enabled', 'true'),
  ('max_order_items', '50'),
  ('collection_only', 'false')
ON CONFLICT (key) DO NOTHING;

-- Seed the Christmas 2026 blocked dates (Dec 5-26, Dec 27, Jan 1-11 2027)
-- These can be managed from Supabase dashboard going forward
DO $$
DECLARE
  d DATE;
BEGIN
  -- Dec 5-26 2026
  FOR d IN SELECT generate_series('2026-12-05'::date, '2026-12-26'::date, '1 day'::interval)::date
  LOOP
    INSERT INTO order_dates_blocked (blocked_date, reason)
    VALUES (d, 'Christmas closure 2026')
    ON CONFLICT (blocked_date) DO NOTHING;
  END LOOP;

  -- Dec 27 hard block
  INSERT INTO order_dates_blocked (blocked_date, reason)
  VALUES ('2026-12-27', 'Post-Christmas closure')
  ON CONFLICT (blocked_date) DO NOTHING;

  -- Jan 1-11 2027 (before reopen on Mon Jan 12)
  FOR d IN SELECT generate_series('2027-01-01'::date, '2027-01-11'::date, '1 day'::interval)::date
  LOOP
    INSERT INTO order_dates_blocked (blocked_date, reason)
    VALUES (d, 'New Year closure 2027')
    ON CONFLICT (blocked_date) DO NOTHING;
  END LOOP;
END $$;

-- Auto-update updated_at on orders
CREATE OR REPLACE FUNCTION update_orders_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS trg_orders_updated_at ON orders;
CREATE TRIGGER trg_orders_updated_at
  BEFORE UPDATE ON orders
  FOR EACH ROW
  EXECUTE FUNCTION update_orders_updated_at();

-- Row Level Security
ALTER TABLE orders ENABLE ROW LEVEL SECURITY;
ALTER TABLE order_items ENABLE ROW LEVEL SECURITY;
ALTER TABLE order_dates_blocked ENABLE ROW LEVEL SECURITY;
ALTER TABLE order_settings ENABLE ROW LEVEL SECURITY;

-- Public can read available dates and settings (needed for the date picker)
CREATE POLICY "Anyone can read blocked dates"
  ON order_dates_blocked FOR SELECT USING (true);

CREATE POLICY "Anyone can read order settings"
  ON order_settings FOR SELECT USING (true);

-- Only the service role (server-side API) can create/update orders
CREATE POLICY "Service role manages orders"
  ON orders FOR ALL USING (auth.role() = 'service_role');

CREATE POLICY "Service role manages order items"
  ON order_items FOR ALL USING (auth.role() = 'service_role');

-- Customers can look up their own orders by email (via anon key)
CREATE POLICY "Customers can view their orders by email"
  ON orders FOR SELECT
  USING (customer_email = current_setting('request.jwt.claims', true)::json->>'email');
