# Spearings Pie Ordering System - Technical Specification

## Overview

Replace FoxyCart with a fully integrated ordering experience built into the Astro site. Customers browse pies, add to cart, pick a collection/delivery date, and pay via Stripe (card, Apple Pay, Google Pay). No user accounts required -- guest checkout with order lookup by email.

---

## Architecture

```
┌─────────────────────────────────────────────────────────┐
│  FRONTEND (Astro + vanilla JS)                          │
│                                                         │
│  /pies ──────────> Cart Sidebar ──────> /checkout        │
│  (browse & add)   (quantities,        (Stripe Payment   │
│                    date picker,        Element + order   │
│                    order summary)      confirmation)     │
└────────────────────────┬────────────────────────────────┘
                         │
                         ▼
┌─────────────────────────────────────────────────────────┐
│  BACKEND (Vercel Serverless Functions)                   │
│                                                         │
│  POST /api/create-order                                  │
│    - Validates date availability                         │
│    - Calculates shipping/totals                          │
│    - Creates Stripe PaymentIntent                        │
│    - Inserts order into Supabase (status: pending)       │
│    - Returns client_secret to frontend                   │
│                                                         │
│  POST /api/webhook (Stripe webhook)                      │
│    - payment_intent.succeeded → mark order confirmed     │
│    - Sends confirmation email via Resend                 │
│    - payment_intent.payment_failed → mark order failed   │
│                                                         │
│  GET /api/order-status?email=...&ref=...                 │
│    - Lookup order by email + reference number            │
└─────────────────────────────────────────────────────────┘
                         │
                         ▼
┌─────────────────────────────────────────────────────────┐
│  DATABASE (Supabase / PostgreSQL)                        │
│                                                         │
│  orders, order_items, order_dates_blocked                │
└─────────────────────────────────────────────────────────┘
                         │
                         ▼
┌─────────────────────────────────────────────────────────┐
│  PAYMENTS (Stripe)                                       │
│                                                         │
│  PaymentIntent API + Payment Element                     │
│  Apple Pay / Google Pay via Payment Request Button        │
└─────────────────────────────────────────────────────────┘
```

---

## Do We Need User Accounts?

**No.** For a local butcher's pie ordering, full user accounts (registration, login, passwords) add friction and complexity without real benefit. Instead:

- **Guest checkout** with name, email, phone, and address
- **Order lookup** by email + order reference (e.g., `SP-20260316-A3F2`)
- **Repeat orders**: Stripe's Link feature auto-fills returning customers' details based on their email
- If needed later, a simple "check your orders" page where customers enter their email and get a magic link

This keeps PII minimal, avoids password management, and means no auth system to build or maintain.

---

## Database Schema (Supabase / PostgreSQL)

### `orders` table

```sql
CREATE TABLE orders (
  id            UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  reference     TEXT NOT NULL UNIQUE,         -- e.g. 'SP-20260316-A3F2'
  status        TEXT NOT NULL DEFAULT 'pending',
                -- pending | confirmed | preparing | ready | collected | delivered | cancelled | refunded
  
  -- Customer details (no accounts)
  customer_name TEXT NOT NULL,
  customer_email TEXT NOT NULL,
  customer_phone TEXT,
  
  -- Delivery/collection
  order_type    TEXT NOT NULL DEFAULT 'collection',  -- collection | delivery
  delivery_address_line1 TEXT,
  delivery_address_line2 TEXT,
  delivery_city TEXT,
  delivery_postcode TEXT,
  delivery_date DATE NOT NULL,               -- the date customer selected
  
  -- Pricing
  subtotal      INTEGER NOT NULL,            -- in pence (e.g. 1250 = £12.50)
  shipping      INTEGER NOT NULL DEFAULT 0,  -- in pence
  total         INTEGER NOT NULL,            -- in pence
  
  -- Stripe
  stripe_payment_intent_id TEXT UNIQUE,
  stripe_client_secret TEXT,                 -- only used during checkout flow
  
  -- Metadata
  notes         TEXT,                        -- customer notes
  created_at    TIMESTAMPTZ DEFAULT now(),
  updated_at    TIMESTAMPTZ DEFAULT now(),
  confirmed_at  TIMESTAMPTZ,
  
  -- Index for order lookup
  CONSTRAINT valid_status CHECK (status IN (
    'pending', 'confirmed', 'preparing', 'ready', 
    'collected', 'delivered', 'cancelled', 'refunded'
  ))
);

CREATE INDEX idx_orders_email ON orders(customer_email);
CREATE INDEX idx_orders_reference ON orders(reference);
CREATE INDEX idx_orders_status ON orders(status);
CREATE INDEX idx_orders_delivery_date ON orders(delivery_date);
```

### `order_items` table

```sql
CREATE TABLE order_items (
  id          UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  order_id    UUID NOT NULL REFERENCES orders(id) ON DELETE CASCADE,
  product_id  UUID NOT NULL REFERENCES products(id),
  product_name TEXT NOT NULL,                -- snapshot at time of order
  quantity    INTEGER NOT NULL CHECK (quantity > 0),
  unit_price  INTEGER NOT NULL,             -- in pence, snapshot at time of order
  line_total  INTEGER NOT NULL,             -- quantity * unit_price, in pence
  created_at  TIMESTAMPTZ DEFAULT now()
);

CREATE INDEX idx_order_items_order ON order_items(order_id);
```

### `order_dates_blocked` table

Replaces the hardcoded JavaScript date logic with an admin-manageable table.

```sql
CREATE TABLE order_dates_blocked (
  id          UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  blocked_date DATE NOT NULL UNIQUE,
  reason      TEXT,                          -- e.g. 'Christmas closure', 'Bank holiday'
  created_at  TIMESTAMPTZ DEFAULT now()
);

CREATE INDEX idx_blocked_dates ON order_dates_blocked(blocked_date);
```

### `order_settings` table

Global configuration that can be updated without code changes.

```sql
CREATE TABLE order_settings (
  key         TEXT PRIMARY KEY,
  value       TEXT NOT NULL,
  updated_at  TIMESTAMPTZ DEFAULT now()
);

-- Seed with defaults
INSERT INTO order_settings (key, value) VALUES
  ('min_lead_days', '2'),                   -- minimum days before delivery
  ('closed_weekdays', '0,1'),               -- Sunday, Monday (0=Sun, 6=Sat)
  ('delivery_fee_pence', '500'),            -- £5.00 delivery fee
  ('free_delivery_threshold_pence', '3000'),-- free delivery over £30
  ('orders_enabled', 'true'),               -- master kill switch
  ('max_order_items', '50'),                -- max items per order
  ('collection_only', 'false');             -- disable delivery temporarily
```

---

## Environment Variables

Add these to your `.env` (local) and Vercel environment settings (production):

```bash
# ── Supabase (already configured) ──
PUBLIC_SUPABASE_URL=https://your-project.supabase.co
PUBLIC_SUPABASE_ANON_KEY=eyJ...
SUPABASE_SERVICE_ROLE_KEY=eyJ...          # Server-side only, never expose to client

# ── Stripe ──
PUBLIC_STRIPE_PUBLISHABLE_KEY=pk_live_...  # Safe for client-side
STRIPE_SECRET_KEY=sk_live_...              # Server-side only, NEVER expose
STRIPE_WEBHOOK_SECRET=whsec_...            # For verifying webhook signatures

# ── Email (Resend) ──
RESEND_API_KEY=re_...                      # For sending order confirmation emails
ORDER_NOTIFICATION_EMAIL=pies@spearings.co.uk  # Where the shop receives orders

# ── App Config ──
PUBLIC_SITE_URL=https://spearings.co.uk    # For generating order links in emails
```

### Where to get these:

| Variable | Where to get it |
|---|---|
| `SUPABASE_SERVICE_ROLE_KEY` | Supabase dashboard → Settings → API → `service_role` key |
| `PUBLIC_STRIPE_PUBLISHABLE_KEY` | [Stripe Dashboard](https://dashboard.stripe.com/apikeys) → Publishable key |
| `STRIPE_SECRET_KEY` | [Stripe Dashboard](https://dashboard.stripe.com/apikeys) → Secret key |
| `STRIPE_WEBHOOK_SECRET` | Created when you set up the webhook endpoint in Stripe |
| `RESEND_API_KEY` | [Resend.com](https://resend.com) → API Keys (free tier: 3,000 emails/month) |

---

## API Endpoints

### `POST /api/create-order`

Called when the customer clicks "Pay" on the checkout page.

**Request body:**
```json
{
  "items": [
    { "product_id": "uuid", "quantity": 2 },
    { "product_id": "uuid", "quantity": 1 }
  ],
  "customer": {
    "name": "Jane Smith",
    "email": "jane@example.com",
    "phone": "07700 900000"
  },
  "delivery": {
    "type": "delivery",
    "date": "2026-03-20",
    "address_line1": "42 Park Lane",
    "address_line2": "",
    "city": "Macclesfield",
    "postcode": "SK11 7NA"
  },
  "notes": "Extra pastry on the pork pie please"
}
```

**Response:**
```json
{
  "order_reference": "SP-20260316-A3F2",
  "client_secret": "pi_xxx_secret_xxx",
  "total": 2750
}
```

**Server-side logic:**
1. Validate all fields
2. Check `orders_enabled` setting
3. Validate delivery date (not blocked, not a closed weekday, meets lead time)
4. Look up products from `products` table, verify prices
5. Calculate subtotal, shipping, total
6. Create Stripe PaymentIntent for the total amount
7. Insert order + order_items into Supabase (status: `pending`)
8. Return `client_secret` to frontend

### `POST /api/webhook`

Stripe sends events here when payment succeeds or fails.

**Handles:**
- `payment_intent.succeeded` → Update order status to `confirmed`, set `confirmed_at`, send emails
- `payment_intent.payment_failed` → Update order status to `cancelled`

### `GET /api/order-status?email=jane@example.com&ref=SP-20260316-A3F2`

Simple order lookup for customers.

### `GET /api/available-dates`

Returns the next 30 available order dates, used by the date picker.

---

## Frontend Components

### 1. Cart (client-side, localStorage)

```
cart = {
  items: [
    { productId: "uuid", name: "Pork Pie - Large", price: 1250, quantity: 2, image: "/images/..." }
  ],
  deliveryType: "collection",
  deliveryDate: null
}
```

Stored in `localStorage` as JSON. A small `cart.js` module provides:
- `addItem(product, qty)`
- `removeItem(productId)`
- `updateQuantity(productId, qty)`
- `getCart()`
- `clearCart()`
- `getTotal()`
- `getItemCount()` (for the header badge)

### 2. Cart Sidebar / Drawer

Slides in from the right when items are added. Shows:
- Line items with quantity controls
- Subtotal
- "Choose date" prompt
- "Proceed to Checkout" button

### 3. Date Picker (native, no jQuery)

A clean calendar component that:
- Fetches available dates from `/api/available-dates`
- Blocks Sundays and Mondays
- Blocks dates from `order_dates_blocked` table
- Enforces minimum lead time (2 days)
- Handles the Christmas closure rules (migrated from your Foxy JS)

### 4. Checkout Page (`/checkout`)

- Order summary (read-only)
- Customer details form (name, email, phone)
- Delivery/collection toggle
- Address fields (if delivery)
- Date display
- Stripe Payment Element (card, Apple Pay, Google Pay)
- "Place Order" button

### 5. Confirmation Page (`/order-confirmed`)

- Order reference number
- Summary of items
- Delivery/collection date
- "We'll send a confirmation email" message

---

## Stripe Setup Steps

1. **Create a Stripe account** (or use the existing one connected to Foxy)
2. **Get API keys** from the Stripe Dashboard
3. **Enable Apple Pay**:
   - Stripe Dashboard → Settings → Payment methods → Apple Pay
   - Register and verify your domain (`spearings.co.uk`)
   - Upload the Apple Pay domain verification file to `public/.well-known/apple-developer-merchantid-domain-association`
4. **Set up webhook**:
   - Stripe Dashboard → Developers → Webhooks → Add endpoint
   - URL: `https://spearings.co.uk/api/webhook`
   - Events: `payment_intent.succeeded`, `payment_intent.payment_failed`
   - Copy the signing secret → `STRIPE_WEBHOOK_SECRET`
5. **Configure Payment Element**:
   - Card payments are enabled by default
   - Apple Pay and Google Pay appear automatically when available

---

## PWA Setup

Add to `public/site.webmanifest`:
```json
{
  "name": "Spearings Butchers - Order Pies",
  "short_name": "Spearings Pies",
  "start_url": "/pies",
  "display": "standalone",
  "background_color": "#081611",
  "theme_color": "#081611",
  "icons": [
    { "src": "/images/pwa-icon-192.png", "sizes": "192x192", "type": "image/png" },
    { "src": "/images/pwa-icon-512.png", "sizes": "512x512", "type": "image/png" }
  ]
}
```

A service worker caches static assets and the product catalog for offline browsing. Orders require connectivity.

---

## Date Control Rules (migrated from Foxy)

The existing logic from your Foxy custom footer is preserved but managed via the database:

| Rule | Implementation |
|---|---|
| Closed Sundays & Mondays | `order_settings.closed_weekdays = '0,1'` |
| Minimum 2-day lead time | `order_settings.min_lead_days = '2'` |
| Christmas closure (Dec 5-26) | Rows in `order_dates_blocked` |
| Dec 27 hard-blocked | Row in `order_dates_blocked` |
| Limited Dec 28-31 trading days | Only unblocked dates appear |
| Jan closure until reopen | Rows in `order_dates_blocked` |
| Master kill switch | `order_settings.orders_enabled = 'false'` |

**Advantage**: No code changes needed to adjust dates. Just add/remove rows in `order_dates_blocked` or update `order_settings` from the Supabase dashboard (or a future admin UI).

---

## Email Notifications

Using [Resend](https://resend.com) (free tier: 3,000 emails/month):

1. **Customer confirmation** -- "Your order SP-20260316-A3F2 is confirmed" with order summary and date
2. **Shop notification** -- Sent to `pies@spearings.co.uk` with full order details for fulfillment

---

## Implementation Order

| Phase | What | Effort |
|---|---|---|
| **1** | Database: Run migrations for orders, order_items, order_dates_blocked, order_settings | 1 hour |
| **2** | Cart module: localStorage-based cart with add/remove/quantity | 2-3 hours |
| **3** | Cart UI: sidebar drawer on /pies page, header badge | 3-4 hours |
| **4** | API: `/api/create-order` + `/api/available-dates` | 3-4 hours |
| **5** | Checkout page: customer form + Stripe Payment Element | 4-5 hours |
| **6** | Webhook + order confirmation: `/api/webhook` + Resend emails | 2-3 hours |
| **7** | Date picker: native calendar with blocked dates | 2-3 hours |
| **8** | Confirmation page + order lookup | 1-2 hours |
| **9** | Apple Pay domain verification + testing | 1 hour |
| **10** | PWA manifest + service worker | 1-2 hours |

**Total estimated effort: 20-28 hours of development**

---

## Dependencies to Install

```bash
npm install stripe @stripe/stripe-js resend
```

---

## Security Considerations

- **Stripe secret key** and **Supabase service role key** are server-side only (Vercel functions), never exposed to the browser
- **Webhook signatures** are verified using `STRIPE_WEBHOOK_SECRET` to prevent spoofed events
- **Price validation** happens server-side -- the frontend cart is for UX only, the API re-calculates totals from the database
- **Date validation** happens server-side -- the API rejects orders for blocked dates even if the frontend is bypassed
- **Rate limiting** on the create-order endpoint (Vercel's built-in or a simple IP-based limiter)
- **No PII stored unnecessarily** -- just name, email, phone, and delivery address for the order
