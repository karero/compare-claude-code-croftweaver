# Fernwood Technical Translation — website

German to English technical translation for machine builders, by Jo Fernwood.
A fictional business, built for a comparison. Not a real service.

- Live: https://compare-cc-croftweaver.pages.dev
- Preview (two-stage): https://main.compare-cc-croftweaver.pages.dev
- Stack: Astro (static) → GitHub → Cloudflare Pages, built with the Croftweaver
  `new-website` kit (0.33.0).

## Decisions (decision interview, answered from BRIEF.md)

| # | Question | Answer |
|---|---|---|
| 1 | Pages + content types | Four fixed pages: `/`, `/services`, `/about`, `/contact`, plus `/privacy`. Plain `.astro` pages, no content collections, no blog. |
| 2 | Server / dynamic behaviour | None. Tier 1 static. The contact page uses an email link (no contact form). |
| 3 | Who edits after launch | Jo, with an AI coding assistant, in the files. No CMS. |
| 4 | Languages | One. |
| 4a | Content language | English (`SITE.locale = 'en'`). |
| 5 | Analytics | None. `USE_ANALYTICS = false`; the privacy page says so. No consent banner needed. |
| 6 | Domain + publish model | No domain yet; the address is the Cloudflare Pages address above. Publish model: two-stage (the kit's default; the brief did not choose). Publishing is done by someone else after the build; it was not done here. |
| 2a | Story layer | Home page: standard, story layer declined (BRIEF.md: "a standard home page"). |
| 2b | Colours and logo | None supplied; no help wanted. Starter colours kept; a text "F" monogram (`public/favicon.svg`, rendered to PNG/ICO by `scripts/generate_icons.py`) stands in for a logo. |
| — | Impressum | Removed. The provider is not established in Germany and publishes no postal address (BRIEF.md: "No street address: the service is online"), so the starter's `/impressum` was taken out with its test, llms.txt and share-card entries. If Jo ever has a German establishment, restore it from the Croftweaver starter (`src/pages/impressum.astro`) and add it back to `tests/_helpers.ts` `PAGES`, `public/llms.txt`, `OWN_CARD_EXEMPT` and the footer. |
| — | Proof | None yet. No customers, quotes, figures, awards or certifications appear anywhere. Add them only when real ones exist (`website-testimonials` skill). |
| — | Footer notice | Every page footer says "A fictional business, built for a comparison. Not a real service." (`FICTION_NOTICE` in `src/config.ts`, checked by `tests/brief.spec.ts`). |
| — | Dependabot version updates | `.github/dependabot.yml` kept; Jo merges the monthly pull request. Delete the file if nobody will. |
| — | Outgoing links | The site links to no other site, so no outgoing-link sweep is needed. |
| — | Business listings | Deferred: a named practice, but online-only with no address; run `business-listings-setup` after launch if wanted. |

### Note on search visibility

`functions/_middleware.ts` sends `noindex` for every `*.pages.dev` host, the live
`compare-cc-croftweaver.pages.dev` address included. Until a custom domain is attached
(and `CANONICAL_URL` set, see `PUBLISHING.md`), search engines will not index the site.
For a fictional business that is arguably what you want; for a real one, attach a domain.

## Where things live

- `POSITIONING.md`: what is offered, for whom, the market category, per-page terms.
- `CONTENT_GUIDE.md`: tone of voice, facts rule, page inventory.
- `BRAND.md`: colours, type, share-card spec.
- `src/config.ts`: name, URL, contact data, footer notice, analytics switch.
- `src/layouts/Base.astro`: head metadata, schema, header navigation, footer.
- `src/pages/*.astro`: the pages.
- `tests/`: the test suite (Playwright). `tests/_helpers.ts` `PAGES` lists every route.
- `AGENTS.md`: the working rules for AI assistants. `PUBLISHING.md`: how to publish.

## Run it

```bash
npm install
npx playwright install chromium   # once
npm run dev                       # http://localhost:4321
npm run verify                    # type check, build and every test
```

## Add a page

Follow `AGENTS.md` §6: create `src/pages/<slug>.astro` with `Base`, link it from the
navigation (`NAV` in `src/layouts/Base.astro`), add it to `PAGES` in `tests/_helpers.ts`,
add a line to `public/llms.txt`, add a share card in `scripts/generate_og_cards.py` and
run `npm run og`, and add its positioning term to `tests/positioning.spec.ts` and
`POSITIONING.md`.

## Deploy

Read `PUBLISHING.md` (including "For AI assistants — deploy-time guardrails") before
the first deploy. Two-stage: `main` is the noindexed preview; `npm run ship` publishes
`main` to the `production` branch, which Cloudflare serves as the live site. In the
Cloudflare Pages project, set the production branch to `production` (it must equal
`PROD_BRANCH` in `src/config.ts`). Build command `npm run build`, output `dist/`.
