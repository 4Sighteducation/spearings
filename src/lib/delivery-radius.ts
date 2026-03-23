/**
 * Delivery area: straight-line miles (haversine) from the shop.
 * postcodes.io (UK) for customer postcode → lat/lng.
 * Shop: SPEARINGS_SHOP_LAT/LNG or default 12 Park Green SK11 7NA.
 *
 * Zones: inner (≤ inner radius, default 5 mi) vs outer (≤ max radius, default 10 mi).
 */
import { getEnv } from './env';

const DEFAULT_SHOP = { lat: 53.256677, lng: -2.123665 };

export function getShopCoordinates(): { lat: number; lng: number } {
  const lat = parseFloat(getEnv('SPEARINGS_SHOP_LAT'));
  const lng = parseFloat(getEnv('SPEARINGS_SHOP_LNG'));
  if (!Number.isNaN(lat) && !Number.isNaN(lng)) {
    return { lat, lng };
  }
  return DEFAULT_SHOP;
}

/** Outer limit — no delivery beyond this (default 10 miles). */
export function getMaxDeliveryMiles(): number {
  const v = parseFloat(getEnv('MAX_DELIVERY_MILES'));
  if (!Number.isNaN(v) && v > 0) return v;
  return 10;
}

/** Inner zone edge — “standard” area with £30 free / £5 under (default 5 miles). */
export function getInnerDeliveryRadiusMiles(): number {
  const v = parseFloat(getEnv('DELIVERY_INNER_RADIUS_MILES'));
  if (!Number.isNaN(v) && v > 0) return v;
  return 5;
}

export function haversineMiles(lat1: number, lon1: number, lat2: number, lon2: number): number {
  const R = 3958.7613;
  const toRad = (d: number) => (d * Math.PI) / 180;
  const dLat = toRad(lat2 - lat1);
  const dLon = toRad(lon2 - lon1);
  const a =
    Math.sin(dLat / 2) ** 2 +
    Math.cos(toRad(lat1)) * Math.cos(toRad(lat2)) * Math.sin(dLon / 2) ** 2;
  return R * 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
}

type PostcodesIoResponse = {
  status: number;
  result?: { latitude: number; longitude: number };
};

export async function geocodeUkPostcode(postcode: string): Promise<{ lat: number; lng: number } | null> {
  const normalized = postcode.trim().toUpperCase().replace(/\s+/g, ' ');
  const compact = normalized.replace(/\s/g, '');
  if (!compact) return null;

  const url = `https://api.postcodes.io/postcodes/${encodeURIComponent(compact)}`;
  const res = await fetch(url, { headers: { Accept: 'application/json' } });
  if (!res.ok) return null;
  const data = (await res.json()) as PostcodesIoResponse;
  if (data.status !== 200 || !data.result) return null;
  return { lat: data.result.latitude, lng: data.result.longitude };
}

export type DeliveryZone = 'inner' | 'outer';

export type DeliveryRadiusResult =
  | {
      ok: true;
      distanceMiles: number;
      maxMiles: number;
      innerRadiusMiles: number;
      zone: DeliveryZone;
    }
  | {
      ok: false;
      error: string;
      distanceMiles?: number;
      maxMiles: number;
      innerRadiusMiles: number;
    };

export async function validateDeliveryPostcode(postcode: string | undefined): Promise<DeliveryRadiusResult> {
  const maxMiles = getMaxDeliveryMiles();
  const innerMiles = getInnerDeliveryRadiusMiles();

  if (!postcode?.trim()) {
    return { ok: false, error: 'Delivery postcode is required.', maxMiles, innerRadiusMiles: innerMiles };
  }

  let dest: { lat: number; lng: number } | null;
  try {
    dest = await geocodeUkPostcode(postcode);
  } catch {
    dest = null;
  }

  if (!dest) {
    return {
      ok: false,
      error:
        'We could not verify that postcode. Check it is a valid UK postcode, or try again in a moment.',
      maxMiles,
      innerRadiusMiles: innerMiles,
    };
  }

  const shop = getShopCoordinates();
  const distanceMiles = haversineMiles(shop.lat, shop.lng, dest.lat, dest.lng);

  if (distanceMiles > maxMiles) {
    return {
      ok: false,
      error: `Sorry — we only deliver within ${maxMiles} miles of our shop. This address is about ${distanceMiles.toFixed(1)} miles away (straight-line). Choose collection, or contact us before ordering.`,
      distanceMiles,
      maxMiles,
      innerRadiusMiles: innerMiles,
    };
  }

  const zone: DeliveryZone = distanceMiles <= innerMiles ? 'inner' : 'outer';

  return {
    ok: true,
    distanceMiles,
    maxMiles,
    innerRadiusMiles: innerMiles,
    zone,
  };
}
