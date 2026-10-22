# CLAUDE.md

Online CV of Adrien Lemaire, served by GitHub Pages from the `html` branch at
https://adrienlemaire.github.io/cv/. The PDF version lives on the `latex`
branch.

## Branch & deploy

- Pushing to `html` deploys the live site. Work on a feature branch and open a
  PR against `html`; never push to `html` directly.
- This file is publicly served too: keep it free of private information.

## Commands

```console
$ nix develop                  # latest Node + Python
$ npm install
$ npm run dev                  # rebuild dist/output.css on change
$ npm run build                # one-shot build, run before committing
$ python -m http.server 8080   # preview at http://localhost:8080
```

## Structure

- `index.html` — the whole CV, two fixed A4 sheets (`.sheet`, 210mm × 297mm):
  sheet 1 = header, summary and the two latest jobs; sheet 2 = older jobs,
  skills, languages, education, certifications, interests. Content that
  outgrows a sheet overflows silently: re-check both after edits.
- `input.css` — Tailwind entry and CSS-first config (`@import`, `@source`,
  `@theme`), `@page` A4 setup and the shared component classes (`.sheet`,
  `.row`, `.bullets`, …).
- `dist/output.css` — generated, but committed because Pages serves the
  branch as-is. Always rebuild and commit it with any class change.
- `assets/` — avatar, background, zondicons SVG icons.
- Tailwind only scans files listed with `@source` in `input.css` (automatic
  detection is off via `source(none)`); add new template files there.

## HTML / CSS practices

- Tailwind v4 (`tailwindcss` + `@tailwindcss/cli`). Configure in CSS via
  `@theme` in `input.css`; there is no `tailwind.config.js`.
- Semantic HTML: `header`, `main`, `section`, `h1`–`h3` in order, lists for
  bullets, `<time datetime="YYYY-MM">` for dates.
- Accessibility: meaningful `alt` text (empty `alt=""` for decorative icons),
  sufficient contrast, links with visible focus states.
- Set `<html lang="en">`, a `<title>`, a meta description and Open Graph tags.
- Must print to exactly two A4 pages (`print:` variants, page break before
  sheet 2); check with the browser's print preview after layout changes.
- No JavaScript unless required; no CDN dependencies.

## Content practices

- Content must stay consistent with the latest PDF on the `latex` branch
  (titles, dates, company names).
- Reverse chronological order. Dates as `YYYY/MM`.
- Bullets start with an action verb and state an outcome, with a number when
  one is available.
- No skill bars, ratings, MBTI or objective statements.

## Commits

- Simple, succinct messages (e.g. `chore: update MadeInTracker`).
- No "Generated with" or "Co-Authored-By" lines.
