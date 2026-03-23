// @ts-check
import { defineConfig } from 'astro/config';
import sitemap from '@astrojs/sitemap';
import vercel from '@astrojs/vercel';

/** Used for canonical URLs, Open Graph, and sitemap.xml (set PUBLIC_SITE_URL on Vercel, e.g. https://spearings.co.uk) */
const site = (process.env.PUBLIC_SITE_URL || 'https://spearings.co.uk').replace(/\/$/, '');

export default defineConfig({
  site,
  output: 'server',
  integrations: [
    sitemap({
      filter: (page) => !page.includes('/admin'),
    }),
  ],
  adapter: vercel({
    webAnalytics: { enabled: true },
  }),
});
