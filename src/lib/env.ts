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

  return cache.get(key) ?? import.meta.env[key] ?? process.env[key] ?? '';
}
