Security review summary

Status: Quick audit performed; no secrets or obvious credentials found in the repository. No automated security scanning was run in this change; this file notes preliminary findings and remediation suggestions.

Preliminary findings
- No TODO/FIXME markers found.
- No occurrences of obvious secret tokens, credentials, or access keys found by a simple keyword scan.

Recommendations
1. Add automated secret scanning (GitHub Advanced Security or a pre-commit hook like detect-secrets).
2. Add a dependency-supply-chain check (e.g., Dependabot + GH alerts).
3. Run a targeted security audit for LaTeX/Typst templates if consuming untrusted input.

If you want, run a deeper automated security scan and implement fixes; otherwise this summary can be committed as-is.
