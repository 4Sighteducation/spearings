import type { APIRoute } from 'astro';
import { adminLogoutHeaders } from '../../../lib/admin-auth';

export const POST: APIRoute = async () => {
  const headers = adminLogoutHeaders();
  headers.set('Location', '/admin/login');
  return new Response(null, { status: 302, headers });
};
