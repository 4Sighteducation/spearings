import type { APIRoute } from 'astro';
import {
  getInnerDeliveryRadiusMiles,
  getMaxDeliveryMiles,
  validateDeliveryPostcode,
} from '../../lib/delivery-radius';

function json(data: unknown, status = 200) {
  return new Response(JSON.stringify(data), {
    status,
    headers: { 'Content-Type': 'application/json' },
  });
}

/** GET ?postcode=SK10+1AB — used by checkout to preview delivery area (server still validates on order). */
export const GET: APIRoute = async ({ url }) => {
  const postcode = url.searchParams.get('postcode') ?? '';
  try {
    const result = await validateDeliveryPostcode(postcode);
    if (result.ok) {
      return json({
        ok: true,
        distanceMiles: result.distanceMiles,
        maxMiles: result.maxMiles,
        innerRadiusMiles: result.innerRadiusMiles,
        zone: result.zone,
      });
    }
    return json({
      ok: false,
      error: result.error,
      distanceMiles: result.distanceMiles,
      maxMiles: result.maxMiles,
      innerRadiusMiles: result.innerRadiusMiles,
    });
  } catch {
    return json(
      {
        ok: false,
        error: 'Could not check delivery area. Try again.',
        maxMiles: getMaxDeliveryMiles(),
        innerRadiusMiles: getInnerDeliveryRadiusMiles(),
      },
      500,
    );
  }
};
