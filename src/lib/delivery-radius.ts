/**
 * Delivery area from the shop: inner zone (default 5 mi) vs outer (default 10 mi max).
 *
 * Postcode → lat/lng: UK postcodes via postcodes.io (no API key).
 * Distance: if GOOGLE_MAPS_API_KEY is set, Google Distance Matrix (driving miles);
 * otherwise straight-line miles (haversine). Same 5 / 10 mile limits apply to either.
 *
 * Shop: SPEARINGS_SHOP_LAT/LNG or default 12 Park Green SK11 7NA.
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

export type DeliveryDistanceMode = 'straight_line' | 'driving';

/** When a server-side Google Maps key is configured, zones use driving distance. */
export function getDeliveryDistanceMode(): DeliveryDistanceMode {
  return getEnv('GOOGLE_MAPS_API_KEY').trim() ? 'driving' : 'straight_line';
}

type DistanceMatrixResponse = {
  status: string;
  rows?: Array<{
    elements?: Array<{
      status: string;
      distance?: { value: number; text: string };
    }>;
  }>;
};

/**
 * Driving distance in miles (road route). Returns null if the API fails or key missing.
 */
export async function googleDrivingDistanceMiles(
  shop: { lat: number; lng: number },
  dest: { lat: number; lng: number },
): Promise<number | null> {
  const key = getEnv('GOOGLE_MAPS_API_KEY').trim();
  if (!key) return null;

  const params = new URLSearchParams({
    origins: `${shop.lat},${shop.lng}`,
    destinations: `${dest.lat},${dest.lng}`,
    units: 'imperial',
    mode: 'driving',
    key,
  });
  const url = `https://maps.googleapis.com/maps/api/distancematrix/json?${params}`;
  try {
    const res = await fetch(url);
    if (!res.ok) return null;
    const data = (await res.json()) as DistanceMatrixResponse;
    if (data.status !== 'OK' || !data.rows?.[0]?.elements?.[0]) return null;
    const el = data.rows[0].elements[0];
    if (el.status !== 'OK' || el.distance == null) return null;
    return el.distance.value / 1609.344;
  } catch {
    return null;
  }
}

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
      distanceMode: DeliveryDistanceMode;
      maxMiles: number;
      innerRadiusMiles: number;
      zone: DeliveryZone;
    }
  | {
      ok: false;
      error: string;
      distanceMiles?: number;
      distanceMode?: DeliveryDistanceMode;
      maxMiles: number;
      innerRadiusMiles: number;
    };

export async function validateDeliveryPostcode(postcode: string | undefined): Promise<DeliveryRadiusResult> {
  const maxMiles = getMaxDeliveryMiles();
  const innerMiles = getInnerDeliveryRadiusMiles();

  if (!postcode?.trim()) {
    return {
      ok: false,
      error: 'Delivery postcode is required.',
      maxMiles,
      innerRadiusMiles: innerMiles,
      distanceMode: getDeliveryDistanceMode(),
    };
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
      distanceMode: getDeliveryDistanceMode(),
    };
  }

  const shop = getShopCoordinates();
  let distanceMiles = haversineMiles(shop.lat, shop.lng, dest.lat, dest.lng);
  let distanceMode: DeliveryDistanceMode = 'straight_line';

  const driving = await googleDrivingDistanceMiles(shop, dest);
  if (driving != null) {
    distanceMiles = driving;
    distanceMode = 'driving';
  }

  const distLabel = distanceMode === 'driving' ? 'driving' : 'straight-line';

  if (distanceMiles > maxMiles) {
    return {
      ok: false,
      error: `Sorry — we only deliver within ${maxMiles} miles of our shop. This address is about ${distanceMiles.toFixed(1)} miles away (${distLabel}). Choose collection, or contact us before ordering.`,
      distanceMiles,
      maxMiles,
      innerRadiusMiles: innerMiles,
      distanceMode,
    };
  }

  const zone: DeliveryZone = distanceMiles <= innerMiles ? 'inner' : 'outer';

  return {
    ok: true,
    distanceMiles,
    distanceMode,
    maxMiles,
    innerRadiusMiles: innerMiles,
    zone,
  };
}
