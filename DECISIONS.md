# CV decision log

Why the 2026 CV (`2026/cto/`, mirrored by the `html` branch) looks the way it
does. Read this before proposing a change: if a proposal reverses an entry
below, say so explicitly and give a reason that answers the original one.

Sources: Claude Code sessions of 2026-10-22/23, 2026-10-25 and 2026-10-26,
PRs #1–#23 and commit history. Driver: **U** = user decision, **U✓** = user
approved a proposal (Claude's or a reviewer's), **C** = Claude alone (weakest:
challenge freely).

## Page budget and layout

- **2 full A4 pages, never 1.3; visible bottom margin on every page** (U✓
  10-22, U 10-25 "Come on, there's no bottom margin…"). Render every page of
  both PDF and HTML, not just the page count.
- **Sheet 1 = header, summary, Made In Tracker, YAOYA; sheet 2 = older roles
  and undated sections** (C 10-22, confirmed 10-25). YAOYA stays on page 1:
  6 years as CTO and ¥100M+ are the main seniority proof and "many readers
  never turn the page" (C 10-25, approved instead of moving Recommendations
  above Experience).
- **Page 1 roles have bullets, page 2 roles are one `\roletext` sentence**
  (U 10-25 "no bullet when a role has a single description").
- **Timeline ends at Education**; Skills, Recommendations, Languages,
  Certifications, Interests are undated ruled sections off the timeline
  (U✓ 10-25).
- **Page 2 is the tight one.** Every past overflow was fixed by trimming
  older roles or certifications (Rakuten audit, ShareWis,
  Alpaca Iromo, Aquasys Uruma-work, Stanford, Wharton). Preferred fixes: cut
  low-value lines or move metadata to the aside (U 10-25).

## Design

- **The PDF mirrors the HTML design** (teal, avatar, timeline, icons). A plain
  single-column PDF was rejected: "really bland, no originality" (U 10-22).
- Lucide icons, all teal-700 `#00786F`, one style (U 10-25). Pins became
  dots, smiley removed, heart for Interests (U 10-25).
- No backgrounds or textures, no teal numbers (they compete with headings and
  look like links), one tint only (behind Skills), body size and leading
  unchanged (reviewers, U✓ 10-25).
- Bold is reserved for key metrics in bullets (U✓ 10-25). Note: €180k and
  €1.7M were never bolded.
- QR code to the online CV on the PDF, download button on the HTML; no QR
  caption (U 10-25).
- Country flags in Languages rejected: a flag is a country, not a language;
  off-palette; ATS noise (C, U "Roger it" 10-25).

## ATS

- Dates and locations are typeset from the body (`\prepaside`/`\placeaside`)
  so they extract next to their title. **Hidden-text tricks refused**:
  extracted text must match what is visible (C 10-25, user had asked).
- `make ats` (poppler raw, pypdf, pdfminer) after every change. pdfminer
  splitting the date column is accepted.
- Education date stays in the aside (U: at line end it "will grow to 2
  lines"); Certifications and Interests stay side by side (U: stacking "will
  overflow").
- "CV" is not used for computer vision (ambiguous, loses the keyword) (C).

## Header

- Headline **"Founding CTO · MedTech SaaS & AI"** (U✓ 10-25 20:41). History:
  "CTO & Co-founder · Full-stack Engineer" → "CTO · AI & Data Products" →
  current. A longer "Regulated B2B SaaS (MedTech) · AI-native engineering"
  was "too long" (U).
- The headline is the CV's own text; it does not have to match LinkedIn
  (U 10-25 correction).
- Contact: city + country, phone (+33, re-added 10-25), email, site, GitHub,
  LinkedIn, "14 recommendations" link; 2 columns (U). No birth date, MBTI or
  street address.

## Summary

- Current (U 10-26): "Trilingual CTO and full-stack engineer…, 9 of them as
  head of engineering ("Head of Engineering" keyword) and 11 in Japan (not
  12). Co-founded the MedTech SaaS Made In Tracker after 6 years as CTO of
  YAOYA."
- **No repetition between the summary and the bullets** (U 10-26): metrics
  live in bullets; languages live in the Languages section.
- Removed on purpose: "UK" (U 10-22), "for users worldwide", "taking products
  from idea to production", "Hands-on across architecture, data pipelines,
  agentic AI tooling and team leadership", "a deeptech startup" (C 10-25, to
  keep YAOYA on page 1).
- A reviewer's "add the funding to the summary" (10-25) was never applied
  and never decided.
- Sylvie Ravasio pull quote under the summary (C proposed, U "Let's try it"
  10-25). No "(translated from French)": "sounds too much like an AI-written
  CV" (U).

## Made In Tracker

- Dates start 2023/03, right after YAOYA, although work began 2022-09
  (U 10-22).
- **`\roledesc` holds only the company context**: B2B SaaS, EU MDR, GDPR,
  labelled deeptech, 1 patent.
- **Funding, valuation and budget live in a bullet, not in the description**
  (U✓ 10-25 13:27). Reason (recruiter-scan reviewer): grey italic over 3
  lines "reads as skippable fine print"; in a bullet "a bold figure can catch
  the eye". Moving them back to a header, aside or description line reverses
  this; don't, unless that reason is answered.
- **Team size lives in the last bullet**, with how the team was built (CTF
  hiring, coaching 12+). Small team size is the CV's weakest point for human
  readers (agents 10-25), so don't promote it to a header line.
- 5 bullets maximum (U 10-25): MD Atlas, security (RLS), EasyUDI + R&D pilots,
  funding, team.
- MD Atlas metrics are the user's own figures and must stay exact:
  - **110,000+ users**, in the MD Atlas bullet (U 10-26, consistent with
    other Made In Tracker documents). Never add "monthly"
    (U correction: silent edit).
  - 5.2M records; 576,000 lines of TypeScript, 2,365 test files ("scope, not
    volume"); MCP server in the official Registry; €300 a month.
  - Left out on purpose: 1,938 PRs ("AI churn"), uptime, 283 registered
    users (low conversion next to visitors), commit counts (vanity).
- MD Atlas is "a search engine", not just an MCP (U 10-22).
- EasyUDI: 14 customers, €40k revenue, go-live in 3 days; Anopa pilot €25k
  (U corrections 10-25). Prolog/SPARQL and "blockchain" (Axone contest) are
  real work and stay as keywords (U 10-25).
- `\stack` line exists on Made In Tracker only. Per-role stack lines were
  never discussed as a policy.

## YAOYA

- Title CTO, 2017/05–2023/02, "YAOYA Inc." per LinkedIn (U delegated 10-22).
- Reach@ first: PHP/jQuery → Django/Wagtail + Kubernetes, 2,000+ articles a
  month, ¥100M+ yearly revenue.
- GOunite "three iterations" to **2,500+ users** (U 10-26). LinkedIn to fix.
- "Led a department of 4 developers and 25 interns" (U 10-26; 100+ interns company-wide). "Supported other
  divisions" cut for space (C).
- Open since 10-22: is "Led"/"Rewrote" too strong? Never answered.

## Older roles

- One sentence each, action verb first (U✓ 10-25).
- **Fry-IT: one sentence, only the user changes it**: "Built a Django
  e-portfolio for London hospitals using TDD (PostgreSQL, Celery); praised by
  Peter Bengtsson (later Mozilla, GitHub)." (praise added by U 10-26). It was
  removed and restored twice; "You gotta make your mind about Fry-IT" (U 10-25). When page 2 needs
  space, trim elsewhere first.
- Rakuten title "Software Engineer" per LinkedIn (U).
  Security audit cut for page 2 margin (C); "43,500+ members" restored
  10-26 (U facts).
- Alpaca.ai: no "Formerly Ikkyo Technology" note (U: it had been removed
  before, page 2 too heavy).
- Pre-2010 roles are left out.
- Company and team size go in the aside (applied 10-26, superseding "not
  shown"). Bullets show the scope of the user's own work (team led, product
  users or revenue).

## Skills, certifications, recommendations, other sections

- Skills rows: Leadership (one line), Domain (EU MDR, UDI/EUDAMED, GS1, GDPR,
  traceability, row-level security), Stack, Data & AI, Infrastructure,
  Practices (U✓ 10-25). Practices stays separate from Leadership (C:
  category mismatch, although the user had agreed to merge).
- Keywords "agentic", "AI agents", "agentic coding (Claude Code)" required
  (U 10-22). Only keywords backed by real work (security added after real
  RLS facts).
- Certifications: only ones that back a claim (Google Cloud Computer Vision
  2023, Neo4j 2020) plus "All 30 certifications on LinkedIn" link. Wharton
  dropped for page 2 margin (C 10-25), Stanford ML dropped (old).
- Recommendations: Jimmy Crequer (YAOYA report, contractor at Made In
  Tracker) and Kevin Mandrick, PhD (CEO); authors in the aside. Wadie's quote
  rejected (U "Not fan"); Marcel replaced by Kevin (C: "resilient leader"
  duplicated). Jimmy's passage ("helped me to become better…") was C's choice
  over the user's "never stops learning"; not explicitly accepted.
- Education: SUPINFO and Dominican University of California (U 10-25).
- Interests: triathlon, ultra-marathon, chess, dog training, "coaching my 3
  daughters in school and sport" (U 10-25; "child education" read oddly).

## Process

- Every content change goes to both the LaTeX PDF and `html` `index.html`,
  and the PDF copy in `assets/` is refreshed. Titles, dates and company names
  stay in sync with LinkedIn: when they change, list the LinkedIn edits for
  the user.
- Work in a branch and give the user commands to test (U 10-25). Never push
  to `html` directly (it deploys). Check a PR is still open before pushing to
  it (U correction 10-23).
- Missing facts are a reason to ask, not to reject an idea; only hard
  constraints count against one (U 10-26).
- When the user is brainstorming, do not edit the CV (U 10-26).
- Tailoring per application goes in the private job-hunt repo
  (`applications/<company>/cv/`), never in this public repo, which would
  disclose where the user applies; `2026/cto/` stays generic (U✓ 10-27,
  replaces the sibling `2026/<company>/` directory).
- A tailored keyword must already appear as the same term in a bullet; a
  tailored CV is built only from the posting itself (U✓ 10-27, after a
  draft stated an unverified claim as fact).

## Facts supplied 2026-10-26 (U)

- Patent: granted; keep the mention as is ("1 patent"), the user did little
  on it.
- Made In Tracker: about 12 employees; "up to 8" is the tech team.
- MD Atlas: show **110,000+ users**, consistent with other Made In Tracker
  documents (U 10-26). Across 170 countries.
- YAOYA: 30 employees; GOunite **2,500+ users**.
- ShareWis: 8 employees, 5 developers.
- Rakuten (O-net): hired in a team of 3 to migrate O-net to Symfony, planned
  for 6–12 months; showed it would take 3 years; proposed a faster rewrite on
  the latest Symfony, refused, so he left (U 10-26). Don't imply the team was
  sized after the estimate, or that he started the migration. CV: "Showed
  that migrating O-net's 40-year-old code (Japan's top marriage agency,
  43,500+ members) needed 3 years, not 6–12 months; pitched a Symfony
  rewrite." 43,500+ members correct; O-net dept about 40 devs. O-net headcount not found online (operated by
  株式会社オーネット, a Rakuten Group company since 2007).
- Alpaca.ai: 5 employees, team of 4; Labellio sold to Kyocera for $300k
  (may be public, U 10-27); Kubernetes, Django, Caffe confirmed.
- Aquasys: 4 employees; managed about 10 freelancers; Django + Odoo.
- Fry-IT: about 12 employees, team of 2; outcome: praised by Peter Bengtsson
  (later Mozilla, GitHub), LinkedIn recommendation of 2010-11-12: "Adrien is
  very enthusiastic and hard working. He is passionate about learning and
  improving and not afraid to confront any areas where he can learn more."
  Adding this outcome reopens the "settled" Fry-IT line at the user's
  request.

## Applied 2026-10-26 (branches `cv-facts`, `cv-facts-html`)

- Summary (U): "Trilingual CTO and full-stack engineer with 16 years of
  experience, 9 of them as head of engineering and 11 in Japan. Co-founded the
  MedTech SaaS Made In Tracker after 6 years as CTO of YAOYA." The language
  list is on page 2 already ("redundant"); no figure repeats the bullets.
- MD Atlas bullet: **110,000+ users** across 170 countries (U: "Nobody's
  going to open GA4, users is fine"; 170 countries confirmed for 110k, U 10-26). Summary no longer carries users.
- Company and team size go in the aside under the location, "N staff · M
  devs" (page 2 roles); page 1 roles show only staff, team size stays in their
  bullets (no repetition). Rakuten: "40 devs · team of 3" (O-net dev team
  about 40; Rakuten headcount irrelevant, U).
- €180k and €1.7M bolded. YAOYA stack moved to a `Stack:` line.
- Page 2 trims approved (U "LGTM"): Aquasys dual-title dates line removed
  (the title still names both roles); Alpaca ends "computer-vision R&D for
  gaming and search leaders" ("Japanese" dropped later the same day, see
  below).
- html meta descriptions now mirror the summary's first sentence.
- html page 2 margin judged fine by U in print preview (10-26).
- YAOYA (U facts 10-26), replacing a short-lived Chibiwork bullet (3-month
  project shut down after the previous CTO left; "quickly forgotten"):
  GOunite's 8-day SME internship programme was its top revenue line; 2.5D
  metaverse web game on GRANDstack + Pixi.js, WebSocket servers autoscaled on
  Kubernetes at 60 fps, zero downtime, Neo4j cluster flawless (cut for
  space); of 25 interns, 4 went on to dev jobs, 1 hired in-house. Not on the
  CV: internal tools for other divisions (macros, KPI dashboards, cron jobs).
  To pay for the extra lines (C): security bullet drops "data served through
  a typed service layer"; team bullet drops "interviews and a live coding
  test"; GOunite drops its product list. Earlier the same day: YAOYA got a Chibiwork bullet (U 10-26: first project, business tools for
  every company of an incubator space, employee-sharing concept) to
  rebalance against Made In Tracker; 25 interns (U).
- To pay for it and restore bottom margins (C 10-26, PDF ≥ 60pt on both
  pages): Made In Tracker funding bullet drops "stretched with cloud credits
  negotiated through incubation programs"; MD Atlas bullet drops the record
  types list; Alpaca drops "AlpacaDB, released as", the stack parenthetical
  (Kubernetes/Django are backed by YAOYA's Stack line; Caffe is obsolete) and
  "Japanese".

## Resolved 10-26

- Reviewer feedback (Made In Tracker dominates; entries mix company, team,
  mission and stack): sizes moved to the aside, YAOYA given outcome bullets
  and a Stack line, Made In Tracker trimmed. PRs #24/#25.
- €180k and €1.7M bolded (#24).
- `make ats` gains a 4th run, pdfminer with `boxes_flow=None`: every date
  sits within a few lines of its title there (default pdfminer still groups
  the date column, accepted).
- pypdf inserts stray spaces from kerning ("Flutter ,", "( €25k)");
  keywords stay intact. Kerning kept as is (U 10-26).

## Open items

Claude owns these: never drop one unless the user explicitly says no.

- LinkedIn: all 10-26 edits applied by the user. Still unknown: Axone honor
  date/prize/number of teams; French profile not verifiable from the export.
