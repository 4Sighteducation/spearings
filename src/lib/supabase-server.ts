import { createClient } from '@supabase/supabase-js';
import { getEnv } from './env';

const url = getEnv('PUBLIC_SUPABASE_URL');
const serviceRoleKey = getEnv('SUPABASE_SERVICE_ROLE_KEY');

if (!url || !serviceRoleKey) {
  throw new Error('Missing SUPABASE_SERVICE_ROLE_KEY or PUBLIC_SUPABASE_URL');
}

export const supabaseAdmin = createClient(url, serviceRoleKey, {
  auth: { persistSession: false, autoRefreshToken: false },
});
