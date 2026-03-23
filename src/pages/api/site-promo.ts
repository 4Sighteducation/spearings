import type { APIRoute } from 'astro';
import { getSitePromoPayload } from '../../lib/site-promo';

/** Public: driving the site announcement modal (no auth). */
export const GET: APIRoute = async () => {
  const payload = await getSitePromoPayload();
  return new Response(JSON.stringify(payload), {
    status: 200,
    headers: { 'Content-Type': 'application/json', 'Cache-Control': 'no-store' },
  });
};
