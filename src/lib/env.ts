/**
 * Reads .env file directly from disk.
 * Bypasses system environment variables that may override project values.
 */
import { readFileSync } from 'node:fs';
import { resolve } from 'node:path';

let cache: Map<string, string> | null = null;

/**
 * Resolve env vars for Node (API routes, webhooks).
 * On Vercel, `process.env` is the source of truth for secrets — prefer it when VERCEL=1
 * so a bundled/empty `.env` in the serverless artifact cannot override dashboard env.
 */
export function getEnv(key: string): string {
  if (!cache) {
    cache = new Map<string, string>();
    try {
      const envPath = resolve(process.cwd(), '.env');
      const content = readFileSync(envPath, 'utf8');
      for (const line of content.split('\n')) {
        const trimmed = line.trim();
        if (!trimmed || trimmed.startsWith('#')) continue;
        const eqIdx = trimmed.indexOf('=');
        if (eqIdx === -1) continue;
        cache.set(trimmed.slice(0, eqIdx), trimmed.slice(eqIdx + 1));
      }
    } catch {
      /* .env not found */
    }
  }

  const vercel = process.env.VERCEL === '1' || process.env.VERCEL === 'true';
  if (vercel) {
    const pv = process.env[key];
    if (typeof pv === 'string' && pv.trim() !== '') {
      return pv.trim();
    }
  }

  const fromFile = cache?.get(key);
  if (fromFile !== undefined && fromFile !== '') {
    return fromFile.trim();
  }
  const fromMeta = import.meta.env[key];
  if (typeof fromMeta === 'string' && fromMeta !== '') {
    return fromMeta.trim();
  }
  const fromProc = process.env[key];
  if (typeof fromProc === 'string' && fromProc !== '') {
    return fromProc.trim();
  }
  return '';
}
