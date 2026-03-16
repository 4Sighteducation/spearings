import type { APIRoute } from 'astro';
import { getAvailableDates } from '../../lib/dates';

export const GET: APIRoute = async () => {
  try {
    const dates = await getAvailableDates(30);
    return new Response(JSON.stringify({ dates }), {
      status: 200,
      headers: { 'Content-Type': 'application/json' },
    });
  } catch (err) {
    console.error('available-dates error:', err);
    return new Response(JSON.stringify({ error: 'Failed to load dates' }), {
      status: 500,
      headers: { 'Content-Type': 'application/json' },
    });
  }
};
