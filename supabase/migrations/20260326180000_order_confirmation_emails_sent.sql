-- Track successful confirmation emails so webhook + browser confirm-payment do not double-send,
-- and so we can safely retry when the first path failed.
ALTER TABLE orders ADD COLUMN IF NOT EXISTS confirmation_emails_sent_at TIMESTAMPTZ;

COMMENT ON COLUMN orders.confirmation_emails_sent_at IS 'Set when customer + shop confirmation emails were sent via Resend';
