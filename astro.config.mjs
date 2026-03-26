// @ts-check
import { defineConfig } from 'astro/config';
import sitemap from '@astrojs/sitemap';
import vercel from '@astrojs/vercel';

/** Used for canonical URLs, Open Graph, and sitemap.xml (set PUBLIC_SITE_URL on Vercel, e.g. https://www.spearings.co.uk) */
const site = (process.env.PUBLIC_SITE_URL || 'https://www.spearings.co.uk').replace(/\/$/, '');

/** Lets Astro trust Host / X-Forwarded-* on Vercel so request.url matches the browser Origin (fixes admin POST / CSRF on *.vercel.app). */
const allowedDomains = [{ hostname: '**.vercel.app', protocol: 'https' }];
try {
  const { hostname } = new URL(site);
  if (hostname && !allowedDomains.some((d) => d.hostname === hostname)) {
    allowedDomains.push({ hostname, protocol: 'https' });
  }
} catch {
  /* ignore invalid site URL */
}

export default defineConfig({
  site,
  output: 'server',
  security: {
    allowedDomains,
  },
  integrations: [
    sitemap({
      filter: (page) => !page.includes('/admin'),
    }),
  ],
  adapter: vercel({
    webAnalytics: { enabled: true },
  }),
});
