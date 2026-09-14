# Changelog & Release Notes

All notable changes to the Temple University Quarto Brand Extension will be documented in this file.

## [Unreleased]

### Added
- **`titlepage-corresponding-only`.** Set `titlepage-corresponding-only: true` in a document's metadata to list only authors marked `corresponding: true` under the `temple-pdf` title page's Correspondence heading. Without it, every author with an email is listed, as before.
- **`titlepage-corner`.** Set `titlepage-corner: false` to drop the cherry corner graphic from the `temple-pdf` title page; the title then starts 1in from the top instead of 3in. The corner stays on by default.

### Changed
- **Oxford comma in title page author lists.** With three or more authors, `temple-pdf` now prints "A, B, and C" instead of "A, B and C". Two authors still read "A and B".

## [1.1.0] - 2026-09-13

### Added
- **Formats:** `_extension.yml` contributes `temple-html`, `temple-pdf` (LaTeX with the Temple title page), `temple-typst`, and `temple-revealjs`.

### Fixed
- **Doubled comma in single-author title pages.** The bundled titlepage template printed "1,,\*" after a lone corresponding author; it now prints "1,\*".
- **Format settings were ignored.** The `defaults: html/pdf/revealjs/titlepage-pdf` blocks in `brand.yml` never took effect—Quarto reads only `defaults.bootstrap` and `defaults.quarto` from a brand file. They now live in the formats above. The `lumen` and `simple` theme settings were dropped, because naming a theme there would override the brand.
- **`temple-pdf` title page failed to compile** once applied: `logo-size` was a bare number, which `\includegraphics` rejects. It is now `0.12\textwidth`.
- **Drifted brand file removed.** The root `_brand.yml` differed from `_extensions/temple/brand.yml` and pointed at a logo that doesn't exist (`Temple_T_logo_svg.png`).

### Changed
- **Palette and fonts follow Temple's current brand** ([CLA Logos and Brand](https://liberalarts.temple.edu/marcom/logos-and-brand)). The old secondary colors (Taupe, Icy Blue, Lime, Eggshell, Ochre, Geranium, Dark Blue) are replaced by Clear Skies, Book Nook, and the formal and casual accents; black is `#000000` instead of `#1d1d1d`. Body text is Faustina and headings Roboto, replacing Source Sans 3. Semantic roles and the LaTeX colors (`templeNightOwl`, `templeBookNook`) were remapped to match.
- **`temple-pdf` title page** uses the `bg-image` theme: a cherry corner graphic with the Temple "T" (`temple-corner.png`) at upper left, a thin cherry rule, numbered affiliations with a correspondence line, and the CBE mailing address (3401 N. Broad Street, 3rd Floor Kresge, Philadelphia, PA 19140) at the bottom. The school/department header and bottom logo were dropped.
- The title page extension moved from `_extensions/nmfs-opensci/titlepage` to `_extensions/titlepage`, so `temple` and `titlepage` sit side by side in this repo and in installed projects (`_extensions/<name>` or `_extensions/<org>/<name>`), which `temple-pdf` relies on.
- `example.qmd` renders every Temple format.

## [1.0.0] - 2026-06-23

### Added
- **Extension Packaging:** Initialized the Quarto brand extension layout under `_extensions/temple/` for easy distribution and sharing.
- **Manifest (`_extension.yml`):** Defined the metadata and mapped the `brand.yml` contribution.
- **Brand Rules (`brand.yml`):** Formatted the palette, typography (Source Sans 3, JetBrains Mono), defaults, and `titlepage-pdf` settings.
- **Logo Integration:** Included the primary Temple "T" logo (`Temple_T_logo.png`) inside the extension directory.
- **Testing & Verification Setup:** Configured a root-level `_quarto.yml` and `example.qmd` to render and test brand styles locally.
