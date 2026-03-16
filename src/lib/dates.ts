/**
 * Server-side date availability logic.
 * Replaces the old jQuery-based Foxy date picker rules.
 */

import { supabaseAdmin } from './supabase-server';

interface OrderSettings {
  min_lead_days: number;
  closed_weekdays: number[];
  orders_enabled: boolean;
}

export async function getOrderSettings(): Promise<OrderSettings> {
  const map = new Map<string, string>();
  try {
    const { data } = await supabaseAdmin
      .from('order_settings')
      .select('key, value');
    for (const row of data ?? []) map.set(row.key, row.value);
  } catch { /* use defaults if table doesn't exist yet */ }

  return {
    min_lead_days: parseInt(map.get('min_lead_days') ?? '2', 10),
    closed_weekdays: (map.get('closed_weekdays') ?? '0,1')
      .split(',')
      .map((d) => parseInt(d.trim(), 10)),
    orders_enabled: map.get('orders_enabled') !== 'false',
  };
}

export async function getBlockedDates(from: Date, to: Date): Promise<Set<string>> {
  const set = new Set<string>();
  try {
    const { data } = await supabaseAdmin
      .from('order_dates_blocked')
      .select('blocked_date')
      .gte('blocked_date', from.toISOString().slice(0, 10))
      .lte('blocked_date', to.toISOString().slice(0, 10));
    for (const row of data ?? []) set.add(row.blocked_date);
  } catch { /* no blocked dates table yet - return empty */ }
  return set;
}

function formatDate(d: Date): string {
  return d.toISOString().slice(0, 10);
}

export async function getAvailableDates(count = 30): Promise<string[]> {
  const settings = await getOrderSettings();
  if (!settings.orders_enabled) return [];

  const today = new Date();
  today.setHours(0, 0, 0, 0);

  const startDate = new Date(today);
  startDate.setDate(startDate.getDate() + settings.min_lead_days);

  const endDate = new Date(today);
  endDate.setDate(endDate.getDate() + 90);

  const blocked = await getBlockedDates(startDate, endDate);
  const available: string[] = [];

  const cursor = new Date(startDate);
  while (available.length < count && cursor <= endDate) {
    const dayOfWeek = cursor.getDay();
    const dateStr = formatDate(cursor);

    if (
      !settings.closed_weekdays.includes(dayOfWeek) &&
      !blocked.has(dateStr)
    ) {
      available.push(dateStr);
    }

    cursor.setDate(cursor.getDate() + 1);
  }

  return available;
}

export async function isDateAvailable(dateStr: string): Promise<boolean> {
  const settings = await getOrderSettings();
  if (!settings.orders_enabled) return false;

  const date = new Date(dateStr + 'T00:00:00');
  const today = new Date();
  today.setHours(0, 0, 0, 0);

  const minDate = new Date(today);
  minDate.setDate(minDate.getDate() + settings.min_lead_days);

  if (date < minDate) return false;
  if (settings.closed_weekdays.includes(date.getDay())) return false;

  const blocked = await getBlockedDates(date, date);
  return !blocked.has(dateStr);
}
