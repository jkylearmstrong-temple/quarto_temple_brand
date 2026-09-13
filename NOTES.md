# Notes

Internal working notes on where this project came from and where it's headed. See `README.md` for installation/usage, and `notes.txt` for detailed Quarto YAML/template implementation notes (font/theme/PDF-engine configuration detail — different purpose than this file).

## Where it came from

Packages Temple University's brand identity — configured specifically for the Center for Biostatistics & Epidemiology (CBE) at the Lewis Katz School of Medicine — as a reusable Quarto extension: a unified `brand.yml` plus branding assets (the Temple "T" logo), meant to be pulled into other Quarto websites, dashboards, presentations, and documents across the ecosystem.

## Key decisions (and why)

- **License: dual `GPL-3 | MIT`, but via a different mechanism than the R packages.** This isn't an R package — no `DESCRIPTION` to hold a `License:` field — so it uses the standard two-file convention instead: `LICENSE-MIT` and `LICENSE-GPL-3` (the latter copied directly from R's own bundled copy, not regenerated, to guarantee the canonical text). Documented in a new "License" section in `README.md`.
- **The license explicitly does not cover the Temple name/logo.** This repo, unlike every other repo in the ecosystem, bundles an actual institutional trademark asset (the Temple "T" logo). The code/config license doesn't grant rights to that — reuse of the logo/name outside Temple-affiliated projects needs Temple's own trademark process, not this repo's license.
- **Scope boundary with `TempleCBE` (decided 2026-09-13).** This repo owns everything Quarto reads: `brand.yml`, the logo, the `temple-*` formats, and the title page. `TempleCBE` owns the R side: `temple_colors()`/`scale_*_temple()`/`theme_temple()` for figures, `use_temple_brand()` to install this extension, `create_report(template_name = "temple")`, and rendering/zipping (`render_me()`, `zip_render()`). `TempleCBE` keeps a copy of `brand.yml` in `inst/brand/` and tests its palette against it, so a palette change here needs a matching change there.
- **Format settings go in `_extension.yml`, not `brand.yml`.** Quarto reads only `defaults.bootstrap` and `defaults.quarto` from a brand file; the 1.0.0 `defaults: html/pdf/titlepage-pdf` blocks were silently ignored (verified against Quarto 1.9.38's schema and by rendering).
- **`titlepage` sits beside `temple`, not under `nmfs-opensci/`.** An extension format can't inherit another extension's format, so `temple-pdf` lists the title page's filters and partials as `../titlepage/...`. That relative path only holds if both extensions share a parent, which `quarto add` guarantees for installs from this repo.

## Current status (2026-09-13)

1.1.0: format settings moved into `temple-html`/`temple-pdf`/`temple-typst`/`temple-revealjs`, drifted root `_brand.yml` removed, title page `logo-size` fixed. All four formats render from a fresh `quarto add` of this repo (Quarto 1.9.38, TeX Live 2026), and `temple-pdf` also renders with the extensions moved to the `_extensions/<org>/<name>` layout a GitHub install uses. Not yet tested: an install straight from GitHub.

## Where it's heading

- Commit + push the license files, 1.1.0 changes, and README update.
- `git_url` is still `TBD` in the tracker — worth confirming the actual GitHub URL once it's set.
