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

/** All values for this cookie name (browsers may send duplicates when Path scopes differ). */
function getCookieValuesForName(cookieHeader: string, name: string): string[] {
  const out: string[] = [];
  if (!cookieHeader) return out;
  const prefix = `${name}=`;
  for (const part of cookieHeader.split(';')) {
    const trimmed = part.trim();
    if (trimmed.startsWith(prefix)) {
      out.push(trimmed.slice(prefix.length));
    }
  }
  return out;
}

export function getAdminFromRequest(request: Request): { email: string } | null {
  const cookies = request.headers.get('cookie') ?? '';
  const values = getCookieValuesForName(cookies, COOKIE_NAME);
  for (const raw of values) {
    const result = verifyAdminToken(decodeURIComponent(raw));
    if (result.valid && result.email) return { email: result.email };
  }
  return null;
}

export function adminLoginHeaders(email: string): Headers {
  const token = createAdminToken(email);
  const headers = new Headers();
  // Drop legacy Path=/admin cookie so only one sp_admin value is sent.
  headers.append('Set-Cookie', `${COOKIE_NAME}=; Path=/admin; HttpOnly; SameSite=Lax; Max-Age=0`);
  // Path must be / so the cookie is sent to /api/admin/* (not only /admin/* pages).
  const secure = import.meta.env.PROD ? '; Secure' : '';
  headers.append(
    'Set-Cookie',
    `${COOKIE_NAME}=${encodeURIComponent(token)}; Path=/; HttpOnly; SameSite=Lax; Max-Age=${MAX_AGE}${secure}`
  );
  return headers;
}

export function adminLogoutHeaders(): Headers {
  const headers = new Headers();
  headers.append('Set-Cookie', `${COOKIE_NAME}=; Path=/admin; HttpOnly; SameSite=Lax; Max-Age=0`);
  headers.append('Set-Cookie', `${COOKIE_NAME}=; Path=/; HttpOnly; SameSite=Lax; Max-Age=0`);
  return headers;
}

export { COOKIE_NAME };
