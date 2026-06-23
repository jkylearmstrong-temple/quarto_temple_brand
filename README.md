# Temple University Quarto Brand Extension

This repository packages the Temple University brand identity—specifically configured for the **Center for Biostatistics & Epidemiology (CBE)** at the Lewis Katz School of Medicine—as a reusable Quarto extension.

It distributes a unified brand configuration (`brand.yml`) and branding assets (such as the Temple "T" logo) that can be easily pulled into and reused across other Quarto websites, dashboards, presentations, and documents.

## Features

- **Color Palette:** Defines primary brand colors (Temple Cherry: `#a41e35`, Black: `#1d1d1d`, White: `#ffffff`) and secondary accents (Taupe, Icy Blue, Lime, Eggshell, Ochre, etc.), mapped to semantic roles (`primary`, `foreground`, `background`, `secondary`, `success`, `warning`, `danger`, `info`, `light`, `dark`).
- **Typography:** Uses professional open-source Google Font alternatives matching Temple style guide typography:
  - Base text & Headings: **Source Sans 3**
  - Monospace/Code block fonts: **JetBrains Mono**
  - Monospace block backgrounds: Warm eggshell (`#f2eee8`)
- **Logo Assets:** Packages the primary Temple "T" logo.
- **Format Defaults:** Bundles styling/layout defaults for:
  - **HTML:** Table of contents, numbered sections, custom themes.
  - **PDF (LaTeX):** Document geometries, color-themed links, margins.
  - **Reveal.js Presentations:** Transition styles, footer layouts, slide numbers.
  - **`titlepage-pdf` (via the `nmfs-opensci/quarto_titlepages` extension):** Layout structures, vertical-rule accent styling, header and footer presets.

---

## Installation

To add this brand extension to your own Quarto project:

1. Ensure your project has a `_quarto.yml` file.
2. In your terminal, run the following command from the root of your project directory:

```bash
quarto add jkylearmstrong/quarto_temple_brand
```

This will download the extension and place the branding configuration and logo asset into your project's local `_extensions/temple/` directory.

---

## Usage

Once installed, enable the brand configuration in your project's `_quarto.yml` file:

```yaml
# _quarto.yml
project:
  title: "My Research Project"

# Reference the installed brand extension
brand: _extensions/temple/brand.yml
```

When you render your project, the colors, fonts, and logo layout rules defined in the extension will be automatically applied to your output formats.

---

## Development & Local Testing

If you are developing or modifying the brand extension itself in this repository:

1. Make your changes directly inside `_extensions/temple/brand.yml` or `_extensions/temple/_extension.yml`.
2. Render the local test page to preview your changes:
   ```bash
   quarto render example.qmd
   ```
3. Check the compiled output file `example.html` in your browser.
