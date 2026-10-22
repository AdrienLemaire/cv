# CLAUDE.md

PDF CV of Adrien Lemaire, written in LaTeX. The online version lives on the
`html` branch (https://adrienlemaire.github.io/cv/).

## Layout

- One directory per year in which the CV was updated (`2010/` … `2026/`).
  Inside, one subdirectory per variant (`engineer/`, `cto/`, …), each with its
  own `Makefile`.
- Older years are an archive: never edit their content (toolchain or build
  fixes are fine). 2026+ CVs use the single-column template in `2026/cto/`:
  start a new CV by copying that directory into a new year directory, then
  rename the `.tex` (`CV_YYYY-MM.tex`) and update `CVNAME` in its `Makefile`.
- `images/` holds portraits, `Certificates/` scanned diplomas, `other/` notes
  (e.g. a LinkedIn export).
- 2015–2018 CVs use the legacy `cv4tw` class (sidebar theme, poor ATS
  extraction); see https://github.com/Cicatrice/cv4tw/blob/master/CUSTOMIZE.md.
  Do not use it for new CVs.

## Commands

```console
$ nix develop                       # or `direnv allow` (.envrc)
$ cd 2026/cto && make force         # xelatex, run twice for references
$ pdfinfo CV_*.pdf                  # page count
$ pdftotext -layout CV_*.pdf -      # what an ATS will read
```

- The flake pins the toolchain (`texlive.withPackages`, gnumake,
  poppler-utils) and exposes TeX Live's OpenType fonts to fontconfig, so
  `fontspec` finds Libertine and FontAwesome by name. Never hardcode font
  paths.
- When a build fails on a missing `.sty`, add the package to `flake.nix`
  rather than vendoring it.
- Only the 2018+ xelatex builds are supported (2026+ is the maintained
  template); 2011–2015 pdflatex builds are kept as-is.

## LaTeX practices

- Compile with `xelatex` + `fontspec`; keep sources UTF-8.
- Keep content separate from presentation: define variant-specific choices
  (theme, colour, which sections to show) at the top of the file, and use
  toggles (e.g. `etoolbox`) rather than duplicated files when variants share
  most content.
- Avoid manual spacing hacks (`\vspace{-…}`, `\\[-2pt]`) to squeeze content;
  fix the content or the length instead.
- Comment out nothing permanently: delete dead content (git keeps history).
- Check `make force` output for overfull/underfull box warnings before
  committing.

## ATS / readability

- After every change, run `pdftotext` and read the output: reading order,
  contact details, dates and keywords must come out as plain text.
- Prefer a single-column body; put contact details in the body, not in
  headers or footers; give icons a plain-text equivalent.
- Disable common ligatures in `fontspec` (`Ligatures=NoCommon`) if keywords
  extract badly.
- Bullets start with an action verb and state an outcome, with a number when
  one is available. No skill bars, ratings, MBTI or objective statements.
- Fill whole pages (1 or 2), never 1.3.

## Content consistency

- Titles, dates (`YYYY/MM`) and company names must match the `html` branch
  `index.html` and LinkedIn.

## Commits

- Commit the `.tex`, `Makefile` and the final `.pdf`; do not commit `.log`
  files (`.aux`/`.out` are legacy and should not be added for new CVs).
- Simple, succinct messages. No "Generated with" or "Co-Authored-By" lines.
