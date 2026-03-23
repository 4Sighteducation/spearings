-- One-off cleanup: remove test orders created before 20 March 2026 (order_items removed via ON DELETE CASCADE)

DELETE FROM orders
WHERE created_at < '2026-03-20T00:00:00+00'::timestamptz;
