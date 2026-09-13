Thank you for your interest in contributing to the Temple Quarto Brand Extension.

Guidelines

- Open issues for bugs or feature requests; use the provided issue templates.
- Fork and create a branch for work; open a PR against this branch when ready.
- Keep changes focused and include a brief rationale in the PR description.

Code of conduct & licensing

- This repository is dual-licensed MIT or GPL-3 for code/config. Temple trademarks (name, "T" logo) are not covered by this license; get approval from Temple MarCom before redistributing institutional marks.

Contact

For brand asset permissions or questions about Temple trademarks, contact kevin.haugh@temple.edu and claweb@temple.edu.


Developer notes

- Run luacheck on the titlepage filters:

    luacheck _extensions/titlepage/*.lua

- Recommended: enable Git LFS for fonts and images in _extensions/titlepage:

    git lfs install
    git lfs track "_extensions/titlepage/images/*"
    git lfs track "_extensions/titlepage/fonts/**"

This repository includes a GitHub Actions workflow at .github/workflows/lua-lint.yml that runs luacheck on push/PR for the titlepage extension.
