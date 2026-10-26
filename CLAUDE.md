# CLAUDE.md

PDF CV of Adrien Lemaire, written in LaTeX. The online version lives on the
`html` branch (https://adrienlemaire.github.io/cv/).

## Layout

- One directory per year in which the CV was updated (`2026/`, …). Inside,
  one subdirectory per variant (`cto/`, …), each with its own `Makefile`.
- The 2010–2018 CVs and cover letters live in the private repo
  `AdrienLemaire/cv-archive` (moved out on 2026-10-26, see `DECISIONS.md`);
  never add them back here. 2026+ CVs use the timeline template in `2026/cto/`, which
  mirrors the `html` branch design (avatar, teal accents, dated timeline):
  start a new CV by copying that directory into a new year directory, then
  rename the `.tex` (`CV_YYYY-MM.tex`) and update `CVNAME` in its `Makefile`.
  Its `icons/*.pdf` are the html branch `assets/icons/*.svg` (Lucide, ISC,
  pre-coloured teal-700 `#00786F`) converted with
  `nix shell nixpkgs#librsvg -c rsvg-convert -f pdf` (librsvg is not in the
  flake). Keep the Lucide icon names so both branches stay in sync.
- `images/` holds portraits, `Certificates/` scanned certificates.

## Commands

```console
$ nix develop                       # or `direnv allow` (.envrc)
$ cd 2026/cto && make force         # xelatex, run twice for references
$ pdfinfo CV_*.pdf                  # page count
$ pdftotext -layout CV_*.pdf -      # visual text layout
$ make ats                          # poppler raw, pypdf, pdfminer (2 modes)
```

- The flake pins the toolchain (`texlive.withPackages`, gnumake,
  poppler-utils, Python with pypdf and pdfminer.six) and exposes TeX Live's
  OpenType fonts to fontconfig, so `fontspec` finds fonts by name; the 2026 template loads
  Noto Sans by TeX Live file name (`NotoSans-Regular.ttf`). Never hardcode
  font paths.
- When a build fails on a missing `.sty`, add the package to `flake.nix`
  rather than vendoring it.

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

- After every change, run `make ats` and read all four outputs: reading
  order, contact details, dates and keywords must come out as plain text,
  each date next to its title and company. `pdftotext -layout` is the most
  forgiving extractor and hides ordering bugs; poppler raw and pypdf follow
  the content stream, pdfminer sorts by position. Default pdfminer
  separates the left date column (accepted); with `boxes_flow=None` each
  date must sit within a few lines of its title.
- Left-column text of a row (dates, locations) is typeset from the body with
  `\prepaside`/`\placeaside`, so it is emitted next to its title while
  drawn in the aside column. Never add hidden or invisible text to steer
  parsers: extracted text must match what is visible.
- Also render every page (`pdftoppm -png`) and check spacing: each page
  needs a visible bottom margin, not just the right page count.
- Keep one reading flow per row (dates/labels column, then body); put
  contact details in the body as plain text, not in headers or footers.
- Icons, the QR code and other decorations are allowed only when hidden from
  text extraction with `accsupp` (`\hidetext` in the 2026 template).
- Disable common ligatures in `fontspec` (`Ligatures=NoCommon`) if keywords
  extract badly.
- Bullets start with an action verb and state an outcome, with a number when
  one is available. No skill bars, ratings, MBTI or objective statements.
- Fill whole pages (1 or 2), never 1.3.

## Tailoring per application

- Keep `2026/cto/` as the generic CV (mirrored by the `html` branch). For a
  specific job, copy it to a sibling variant directory (e.g.
  `2026/<company>/`, `CVNAME` updated) and adapt only `\cvheadline`, the
  summary and Skills to mirror the job description's keywords.
- Mirror wording, never invent experience: every keyword must be backed by a
  bullet. Titles, dates and companies stay identical to the generic CV.

## Content consistency

- Titles, dates (`YYYY/MM`) and company names must match the `html` branch
  `index.html` and LinkedIn. This rule means syncing, not freezing: when a
  change touches them, update the `html` branch and list the exact LinkedIn
  edits for the user.

## Evaluating ideas and feedback

- Read `DECISIONS.md` before proposing CV changes. If a proposal reverses an
  entry, say so and answer the original reason; record every new decision
  there.

- Missing facts are a reason to ask, never to reject: ask the user targeted
  questions (company size, revenue or funding, team size, stack, outcome
  numbers) instead of discarding an idea as "unknown data".
- Only hard constraints count against an idea (page budget, ATS extraction,
  no invented experience). Before rejecting one, look for an alternative that
  satisfies them (e.g. metadata in the aside column) and present the
  trade-offs.

## Commits

- Commit the `.tex`, `Makefile` and the final `.pdf`; never commit `.log`,
  `.aux` or `.out` files.
- Never put private data in the repo (street address, date of birth,
  personal ID): it is public, and history is not a safe place to delete
  from.
- Simple, succinct messages. No "Generated with" or "Co-Authored-By" lines.
