import { supabaseAdmin } from './supabase-server';

const PROMO_KEYS = [
  'site_promo_enabled',
  'site_promo_start',
  'site_promo_end',
  'site_promo_title',
  'site_promo_body',
  'site_promo_theme',
  'site_promo_campaign_id',
] as const;

/** Calendar date in Europe/London as YYYY-MM-DD */
export function todayLondonYYYYMMDD(): string {
  return new Intl.DateTimeFormat('en-CA', {
    timeZone: 'Europe/London',
    year: 'numeric',
    month: '2-digit',
    day: '2-digit',
  }).format(new Date());
}

function isYyyyMmDd(s: string): boolean {
  return /^\d{4}-\d{2}-\d{2}$/.test(s.trim());
}

/** Inclusive range: start <= today <= end (all YYYY-MM-DD). */
export function isDateInInclusiveRange(today: string, start: string, end: string): boolean {
  if (!isYyyyMmDd(start) || !isYyyyMmDd(end)) return false;
  return start <= today && today <= end;
}

export type SitePromoTheme = 'easter' | 'christmas' | 'spring' | 'gold' | 'green' | 'neutral';

export type SitePromoPayload = {
  visible: boolean;
  title: string;
  body: string;
  theme: SitePromoTheme;
  campaignId: string;
};

const DEFAULT_THEME: SitePromoTheme = 'neutral';

export async function getSitePromoPayload(): Promise<SitePromoPayload> {
  const empty: SitePromoPayload = {
    visible: false,
    title: '',
    body: '',
    theme: DEFAULT_THEME,
    campaignId: 'default',
  };

  try {
    const { data: rows } = await supabaseAdmin
      .from('order_settings')
      .select('key, value')
      .in('key', [...PROMO_KEYS]);

    const map = new Map((rows ?? []).map((r: { key: string; value: string }) => [r.key, r.value]));

    const enabled = map.get('site_promo_enabled') === 'true';
    const start = (map.get('site_promo_start') ?? '').trim();
    const end = (map.get('site_promo_end') ?? '').trim();
    const title = (map.get('site_promo_title') ?? '').trim();
    const body = map.get('site_promo_body') ?? '';
    const themeRaw = (map.get('site_promo_theme') ?? 'neutral').trim().toLowerCase();
    const campaignId = (map.get('site_promo_campaign_id') ?? 'default').trim() || 'default';

    const themes: SitePromoTheme[] = ['easter', 'christmas', 'spring', 'gold', 'green', 'neutral'];
    const theme = themes.includes(themeRaw as SitePromoTheme) ? (themeRaw as SitePromoTheme) : DEFAULT_THEME;

    const today = todayLondonYYYYMMDD();
    const inWindow = isDateInInclusiveRange(today, start, end);
    const visible = enabled && inWindow && (title.length > 0 || body.trim().length > 0);

    return {
      visible,
      title: title || 'Announcement',
      body,
      theme,
      campaignId,
    };
  } catch {
    return empty;
  }
}
