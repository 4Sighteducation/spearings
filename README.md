# Spearings Rebuild

Astro frontend rebuild for Spearings, with a Supabase-ready catalogue backend seeded from the exported Webflow products CSV.

## Key Files

```text
/
├── data/catalog.json
├── scripts/import-products.mjs
├── src/lib/supabase.ts
├── src/layouts/Layout.astro
├── src/pages/
├── src/styles/site.css
└── supabase/
    ├── config.toml
    ├── migrations/20260309150000_catalog_schema.sql
    └── seed.sql
```

## Commands

All commands run from `rebuild/web`:

| Command | Action |
| :-- | :-- |
| `npm install` | Install dependencies |
| `npm run dev` | Start Astro on `localhost:4321` |
| `npm run build` | Build the frontend |
| `npm run catalog:import` | Parse the Webflow CSV into `data/catalog.json` and `supabase/seed.sql` |
| `npm run supabase:start` | Start local Supabase services with Docker |
| `npm run supabase:status` | Check local Supabase status |
| `npm run supabase:reset` | Apply migrations and seed locally |

## Product Import Workflow

The source catalogue currently comes from:

- `../../Spearings - Spearings Products - 65aac0c230244b51ed39bd17.csv`

The import script:

- normalizes categories and subcategories
- strips HTML from descriptions for app/frontend use
- keeps the original HTML where useful
- preserves Webflow image URLs for now
- generates:
  - `data/catalog.json`
  - `supabase/seed.sql`

## Supabase Notes

Local Supabase requires Docker running on your machine.

If you want to connect the Astro site to a hosted Supabase project, create `.env` from `.env.example` and add:

```bash
PUBLIC_SUPABASE_URL=...
PUBLIC_SUPABASE_ANON_KEY=...
```

## Current Limitation

The catalogue import files are ready, but an actual database import still requires one of:

1. Docker running locally so `supabase start` / `supabase db reset` can run
2. Access to a hosted Supabase project so the schema and seed can be applied there
