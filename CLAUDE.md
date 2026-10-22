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
$ nix develop                  # Node LTS + Python
$ npm install
$ npm run dev                  # rebuild dist/output.css on change
$ npm run build                # one-shot build, run before committing
$ python -m http.server 8080   # preview at http://localhost:8080
```

## Structure

- `index.html` — the whole CV, a single A4-sized page (`w-[210mm] h-[297mm]`).
- `input.css` — Tailwind entry (`@tailwind` directives only).
- `dist/output.css` — generated, but committed because Pages serves the
  branch as-is. Always rebuild and commit it with any class change.
- `assets/` — avatar, background, zondicons SVG icons.
- The `--content index.html` flag in npm scripts is what Tailwind scans; the
  `content` key in `tailwind.config.js` is not used.

## HTML / CSS practices

- Tailwind 3.x only. Do not migrate to v4 without a dedicated PR (config and
  directives change).
- Semantic HTML: `header`, `main`, `section`, `h1`–`h3` in order, lists for
  bullets, `<time datetime="YYYY-MM">` for dates.
- Accessibility: meaningful `alt` text (empty `alt=""` for decorative icons),
  sufficient contrast, links with visible focus states.
- Set `<html lang="en">`, a `<title>`, a meta description and Open Graph tags.
- Must print cleanly to A4 (`print:` variants); check with the browser's print
  preview after layout changes.
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
