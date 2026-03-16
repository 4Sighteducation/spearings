import { getEnv } from './env';
import { createHmac } from 'node:crypto';

const SECRET = getEnv('SUPABASE_SERVICE_ROLE_KEY');
const ADMIN_EMAIL = getEnv('ADMIN_EMAIL') || 'admin@spearings.co.uk';
const ADMIN_PASSWORD = getEnv('ADMIN_PASSWORD');
const COOKIE_NAME = 'sp_admin';
const MAX_AGE = 60 * 60 * 8; // 8 hours

function sign(payload: string): string {
  return createHmac('sha256', SECRET).update(payload).digest('hex');
}

export function createAdminToken(email: string): string {
  const expires = Date.now() + MAX_AGE * 1000;
  const payload = `${email}|${expires}`;
  return `${payload}|${sign(payload)}`;
}

export function verifyAdminToken(token: string): { valid: boolean; email?: string } {
  const parts = token.split('|');
  if (parts.length !== 3) return { valid: false };

  const [email, expiresStr, sig] = parts;
  const payload = `${email}|${expiresStr}`;

  if (sign(payload) !== sig) return { valid: false };
  if (Date.now() > parseInt(expiresStr, 10)) return { valid: false };

  return { valid: true, email };
}

export function validateCredentials(email: string, password: string): boolean {
  if (!ADMIN_PASSWORD) return false;
  return email.toLowerCase() === ADMIN_EMAIL.toLowerCase() && password === ADMIN_PASSWORD;
}

export function getAdminFromRequest(request: Request): { email: string } | null {
  const cookies = request.headers.get('cookie') ?? '';
  const match = cookies.match(new RegExp(`${COOKIE_NAME}=([^;]+)`));
  if (!match) return null;

  const result = verifyAdminToken(decodeURIComponent(match[1]));
  if (!result.valid || !result.email) return null;
  return { email: result.email };
}

export function adminLoginHeaders(email: string): Headers {
  const token = createAdminToken(email);
  const headers = new Headers();
  headers.set(
    'Set-Cookie',
    `${COOKIE_NAME}=${encodeURIComponent(token)}; Path=/admin; HttpOnly; SameSite=Lax; Max-Age=${MAX_AGE}`
  );
  return headers;
}

export function adminLogoutHeaders(): Headers {
  const headers = new Headers();
  headers.set(
    'Set-Cookie',
    `${COOKIE_NAME}=; Path=/admin; HttpOnly; SameSite=Lax; Max-Age=0`
  );
  return headers;
}

export { COOKIE_NAME };
