-- Sequential order references (SP00000250…) + checkout idempotency to prevent duplicate orders

-- Atomic sequence: next issued number is last_value + 1; first new order will be SP00000250 when last_value starts at 249
CREATE TABLE IF NOT EXISTS order_number_sequence (
  id int PRIMARY KEY DEFAULT 1 CHECK (id = 1),
  last_value int NOT NULL DEFAULT 249
);

INSERT INTO order_number_sequence (id, last_value)
VALUES (1, 249)
ON CONFLICT (id) DO NOTHING;

CREATE OR REPLACE FUNCTION allocate_spearings_order_ref()
RETURNS text
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  v int;
BEGIN
  UPDATE order_number_sequence
  SET last_value = last_value + 1
  WHERE id = 1
  RETURNING last_value INTO v;
  RETURN 'SP' || lpad(v::text, 8, '0');
END;
$$;

REVOKE ALL ON FUNCTION allocate_spearings_order_ref() FROM PUBLIC;
GRANT EXECUTE ON FUNCTION allocate_spearings_order_ref() TO service_role;

ALTER TABLE orders ADD COLUMN IF NOT EXISTS checkout_idempotency_key TEXT;

CREATE UNIQUE INDEX IF NOT EXISTS idx_orders_checkout_idempotency_key
  ON orders (checkout_idempotency_key)
  WHERE checkout_idempotency_key IS NOT NULL;
