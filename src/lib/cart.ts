/**
 * Client-side cart stored in localStorage.
 * All prices are in pence (integer) to avoid floating-point issues.
 */

const STORAGE_KEY = 'spearings_cart';

export interface CartItem {
  slug: string;
  name: string;
  price: number;       // pence
  size: string | null;
  imageUrl: string | null;
  quantity: number;
}

export interface Cart {
  items: CartItem[];
  deliveryType: 'collection' | 'delivery';
  deliveryDate: string | null;
}

function emptyCart(): Cart {
  return { items: [], deliveryType: 'collection', deliveryDate: null };
}

export function getCart(): Cart {
  if (typeof window === 'undefined') return emptyCart();
  try {
    const raw = localStorage.getItem(STORAGE_KEY);
    if (!raw) return emptyCart();
    const parsed = JSON.parse(raw);
    if (!parsed || !Array.isArray(parsed.items)) return emptyCart();
    return parsed as Cart;
  } catch {
    return emptyCart();
  }
}

function saveCart(cart: Cart): void {
  localStorage.setItem(STORAGE_KEY, JSON.stringify(cart));
  window.dispatchEvent(new CustomEvent('cart:updated', { detail: cart }));
}

export function addItem(product: {
  slug: string;
  name: string;
  price: number;
  size: string | null;
  imageUrl: string | null;
}, qty = 1): Cart {
  const cart = getCart();
  const existing = cart.items.find((i) => i.slug === product.slug);

  if (existing) {
    existing.quantity += qty;
  } else {
    cart.items.push({
      slug: product.slug,
      name: product.name,
      price: product.price,
      size: product.size,
      imageUrl: product.imageUrl,
      quantity: qty,
    });
  }

  saveCart(cart);
  return cart;
}

export function removeItem(slug: string): Cart {
  const cart = getCart();
  cart.items = cart.items.filter((i) => i.slug !== slug);
  saveCart(cart);
  return cart;
}

export function updateQuantity(slug: string, qty: number): Cart {
  const cart = getCart();
  if (qty <= 0) return removeItem(slug);

  const item = cart.items.find((i) => i.slug === slug);
  if (item) item.quantity = qty;

  saveCart(cart);
  return cart;
}

export function setDeliveryType(type: 'collection' | 'delivery'): Cart {
  const cart = getCart();
  cart.deliveryType = type;
  saveCart(cart);
  return cart;
}

export function setDeliveryDate(date: string | null): Cart {
  const cart = getCart();
  cart.deliveryDate = date;
  saveCart(cart);
  return cart;
}

export function clearCart(): Cart {
  const cart = emptyCart();
  saveCart(cart);
  return cart;
}

export function getSubtotal(): number {
  const cart = getCart();
  return cart.items.reduce((sum, item) => sum + item.price * item.quantity, 0);
}

export function getItemCount(): number {
  const cart = getCart();
  return cart.items.reduce((sum, item) => sum + item.quantity, 0);
}

export function formatPence(pence: number): string {
  return `£${(pence / 100).toFixed(2)}`;
}
