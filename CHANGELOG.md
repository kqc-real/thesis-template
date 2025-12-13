# Changelog

## v1.0.0 - 2025-12-13

Release artifacts:

- `Thesis.pdf` (80 pages)
  - Size: 614K (reported by `ls -lh`)
  - SHA-256: `620ac5a9c01601539200b04d65cd8768dcb6c2a1563dc03986c749b21adc39c9`

Notable changes since previous commits:

- chore(docs): document `build.sh` usage in `README.md` and make script executable
- fix(layout): wrapped long description/itemize blocks in `content/03_Konzept.tex` and `content/04_Realisierung.tex` with `\\begin{sloppypar}...\\end{sloppypar}` to reduce layout badness

Build and verification:

- Build sequence used: `pdflatex` → `biber` → `pdflatex` → `pdflatex` (via `./build.sh`)
- Index generated (119 entries accepted). Bibliography processed with `biber`.
- Cosmetic Underfull/Overfull warnings remain; not blocking the release.

How to reproduce locally:

```bash
# prerequisites: TeX Live, biber, makeindex
./build.sh
```

If you want me to create the GitHub release and upload `Thesis.pdf`, give permission and ensure `gh` CLI is configured (or I can provide the web steps).

----
Generated automatically.
