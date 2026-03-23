import { getEnv } from './env';

/** Deploy hook URLs look like .../deploy/prj_xxxxx/... */
export function extractProjectIdFromDeployHookUrl(hookUrl: string): string | null {
  const m = hookUrl.trim().match(/\/deploy\/(prj_[a-zA-Z0-9]+)\//);
  return m?.[1] ?? null;
}

/** Polling needs a Vercel token + project id (explicit or parsed from the hook URL). */
export function isPublishStatusPollingConfigured(): boolean {
  const token = getEnv('VERCEL_TOKEN').trim();
  if (!token) return false;
  const explicit = getEnv('VERCEL_PROJECT_ID').trim();
  if (explicit) return true;
  return Boolean(extractProjectIdFromDeployHookUrl(getEnv('VERCEL_DEPLOY_HOOK_URL')));
}
