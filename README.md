# Spearings

Astro frontend rebuild for Spearings, with a Supabase-ready catalogue backend and a Vercel-friendly deployment setup.

## Stack

- Astro
- Supabase
- Static deploys via Vercel

## Project Structure

```text
.
├── data/
├── public/
├── scripts/
├── src/
│   ├── layouts/
│   ├── lib/
│   ├── pages/
│   └── styles/
├── supabase/
├── astro.config.mjs
├── package.json
└── README.md
```

## Commands

Run all commands from the repository root:

| Command | Action |
| :-- | :-- |
| `npm install` | Install dependencies |
| `npm run dev` | Start Astro on `localhost:4321` |
| `npm run build` | Build the site into `dist/` |
| `npm run preview` | Preview the production build locally |
| `npm run catalog:import` | Generate `data/catalog.json` and `supabase/seed.sql` from the source export |
| `npm run supabase:start` | Start local Supabase services with Docker |
| `npm run supabase:status` | Check local Supabase status |
| `npm run supabase:reset` | Apply migrations and seed locally |

## Environment Variables

For hosted Supabase usage, add the following environment variables:

```bash
PUBLIC_SUPABASE_URL=...
PUBLIC_SUPABASE_ANON_KEY=...
```

These are the same variables expected in local `.env` files and in Vercel project settings.

## Vercel Setup

Use these Vercel settings:

- Framework Preset: `Astro`
- Root Directory: `./`
- Build Command: `npm run build`
- Output Directory: `dist`

Do not use the `Next.js` preset for this repo.

## Notes

- Local Supabase requires Docker.
- Build output, local env files, and Vercel project metadata are ignored via `.gitignore`.
