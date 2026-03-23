import type { APIRoute } from 'astro';
import { getAdminFromRequest } from '../../../lib/admin-auth';
import { getEnv } from '../../../lib/env';
import { extractProjectIdFromDeployHookUrl } from '../../../lib/vercel-deploy';

type DeploymentRow = {
  created?: number;
  readyState?: string;
  state?: string;
  url?: string | null;
};

/**
 * Poll Vercel for deployment status after triggering a deploy hook.
 * Requires VERCEL_TOKEN (read deployments). Project id from VERCEL_PROJECT_ID or parsed from hook URL.
 */
export const GET: APIRoute = async ({ request }) => {
  const admin = getAdminFromRequest(request);
  if (!admin) return new Response(JSON.stringify({ error: 'Unauthorized' }), { status: 401 });

  const url = new URL(request.url);
  const sinceParam = url.searchParams.get('since');
  const sinceMs = sinceParam ? parseInt(sinceParam, 10) : NaN;
  if (!sinceMs || Number.isNaN(sinceMs)) {
    return new Response(JSON.stringify({ error: 'Missing or invalid since' }), { status: 400 });
  }

  const token = getEnv('VERCEL_TOKEN').trim();
  const hookUrl = getEnv('VERCEL_DEPLOY_HOOK_URL');
  const projectId = getEnv('VERCEL_PROJECT_ID').trim() || extractProjectIdFromDeployHookUrl(hookUrl);

  if (!token || !projectId) {
    return new Response(JSON.stringify({ pollingAvailable: false }), {
      status: 200,
      headers: { 'Content-Type': 'application/json' },
    });
  }

  const teamId = getEnv('VERCEL_TEAM_ID').trim();
  const apiUrl = new URL('https://api.vercel.com/v6/deployments');
  apiUrl.searchParams.set('projectId', projectId);
  apiUrl.searchParams.set('limit', '15');
  if (teamId) apiUrl.searchParams.set('teamId', teamId);

  try {
    const res = await fetch(apiUrl.toString(), {
      headers: { Authorization: `Bearer ${token}` },
    });
    const bodyText = await res.text();
    if (!res.ok) {
      return new Response(
        JSON.stringify({ error: `Vercel API ${res.status}: ${bodyText.slice(0, 240)}` }),
        { status: 502 },
      );
    }

    const data = JSON.parse(bodyText) as { deployments?: DeploymentRow[] };
    const deployments = data.deployments ?? [];

    const minCreated = sinceMs - 25_000;
    const candidates = deployments
      .filter((d) => typeof d.created === 'number' && d.created >= minCreated)
      .sort((a, b) => (b.created ?? 0) - (a.created ?? 0));

    const latest = candidates[0];
    if (!latest) {
      return new Response(
        JSON.stringify({
          pollingAvailable: true,
          waiting: true,
          readyState: null,
        }),
        { status: 200, headers: { 'Content-Type': 'application/json' } },
      );
    }

    const readyState = String(latest.readyState ?? latest.state ?? '');
    const terminal = ['READY', 'ERROR', 'CANCELED'];
    const waiting = !terminal.includes(readyState);

    return new Response(
      JSON.stringify({
        pollingAvailable: true,
        waiting,
        readyState,
        url: latest.url ?? null,
        created: latest.created,
      }),
      { status: 200, headers: { 'Content-Type': 'application/json' } },
    );
  } catch (e: unknown) {
    const message = e instanceof Error ? e.message : 'Request failed';
    return new Response(JSON.stringify({ error: message }), { status: 500 });
  }
};
