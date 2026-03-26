/**
 * Reads .env file directly from disk.
 * Bypasses system environment variables that may override project values.
 */
import { readFileSync } from 'node:fs';
import { resolve } from 'node:path';

let cache: Map<string, string> | null = null;

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
    } catch { /* .env not found */ }
  }

  const fromFile = cache?.get(key);
  if (fromFile !== undefined && fromFile !== '') {
    return fromFile;
  }
  const fromMeta = import.meta.env[key];
  if (typeof fromMeta === 'string' && fromMeta !== '') {
    return fromMeta;
  }
  const fromProc = process.env[key];
  if (typeof fromProc === 'string' && fromProc !== '') {
    return fromProc;
  }
  return '';
}
