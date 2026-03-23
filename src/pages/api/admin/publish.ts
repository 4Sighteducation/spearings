import type { APIRoute } from 'astro';
import { getAdminFromRequest } from '../../../lib/admin-auth';
import { getEnv } from '../../../lib/env';

/**
 * Triggers a Vercel production deploy via Deploy Hook so prerendered catalog pages
 * pick up latest Supabase data. Hook URL must stay server-side only.
 */
export const POST: APIRoute = async ({ request }) => {
  const admin = getAdminFromRequest(request);
  if (!admin) return new Response(JSON.stringify({ error: 'Unauthorized' }), { status: 401 });

  const hookUrl = getEnv('VERCEL_DEPLOY_HOOK_URL').trim();
  if (!hookUrl) {
    return new Response(
      JSON.stringify({
        error: 'Publishing is not configured. Set VERCEL_DEPLOY_HOOK_URL in the project environment.',
      }),
      { status: 503 },
    );
  }

  try {
    const res = await fetch(hookUrl, { method: 'POST' });
    const bodyText = await res.text();
    if (!res.ok) {
      return new Response(
        JSON.stringify({
          error: `Deploy hook returned ${res.status}: ${bodyText.slice(0, 300)}`,
        }),
        { status: 502 },
      );
    }
    let job: unknown;
    try {
      job = JSON.parse(bodyText);
    } catch {
      job = undefined;
    }
    return new Response(JSON.stringify({ ok: true, job }), {
      status: 200,
      headers: { 'Content-Type': 'application/json' },
    });
  } catch (e: unknown) {
    const message = e instanceof Error ? e.message : 'Request failed';
    return new Response(JSON.stringify({ error: message }), { status: 500 });
  }
};
