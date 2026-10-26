<!--
  CONTENT_GUIDE.md — per-site voice & content guide (tone of voice + EEAT).
  Single source of truth for HOW the site says things. POSITIONING (what you offer,
  for whom, the market category) lives in POSITIONING.md; read it, do not restate it
  here. Pairs with BRAND.md (how it looks) and is enforced by the tone test
  (tests/tone.spec.ts).
-->
# Fernwood Technical Translation — content guide

## Positioning (owned by website-positioning — read, do not restate)

The positioning statement, target customer, market category and boilerplate live
in **POSITIONING.md**.

- **Top 3 jobs-to-be-done (for copy):** get an English manual their engineers can sign
  off with little rework · keep part names identical across every manual · know the
  translation cost before the job starts
- **Primary action we want:** email Jo with a document for a fixed-price quote

## Tone of voice

Write like an engineer explaining a job to another engineer: plain, exact, calm,
unhurried. Short sentences. Mechanism over claims. Active voice. First person ("I")
on the About page, where Jo speaks; elsewhere the business speaks of Jo by name.

**Content language:** English.

**Shared rules (enforced by the tone test — run after every copy change):**
- **No em dashes (—).** Use a comma, period, or colon.
- Genuine quoted customer/human voice is exempt: wrap in `<blockquote>`, `<q>`,
  or add `data-tov-exempt`. (There are no customer quotes. Do not invent any.)

**English rules:**
- Speak to the reader as "you".
- **No contractions.** Long form: "cannot", "it is", "you are".
- **No buzzwords:** supercharge, world-class, leverage, unlock, seamless, robust,
  cutting-edge, empower, holistic, revolutionary, synergy, next-level.
- Name document types precisely: operating manuals, maintenance instructions,
  specifications, safety notes. Not "content", not "assets".

**Do / don't examples**
- Do: "You get one price per job, agreed before work starts."
- Don't: "Affordable, transparent pricing tailored to you." (vague, and claims nothing
  checkable)
- Do: "Jo trained as a mechanical engineer."
- Don't: "Trusted by leading machine builders." (no clients may be named or implied)

## Facts rule

Only the facts in BRIEF.md may appear: the services, Jo's training, the pricing model,
the terminology practice, email `jo@example.com`, phone +1 555 0142. No customers,
quotes, client names, figures, awards, certifications, years of experience, turnaround
times or language-pair extras. Every page footer carries: "A fictional business, built
for a comparison. Not a real service."

## EEAT signals (build in from the start)

- **Experience / Expertise:** a named person (Jo Fernwood) with the one stated
  credential (trained mechanical engineer); `Person` schema on the About page. No
  invented years or employers.
- **Authoritativeness:** no `sameAs` profiles exist yet; add them only once real ones
  resolve.
- **Trust:** clear contact (email and phone on the contact and privacy pages, the
  contact page linked from every page's navigation and footer); privacy page; the fictional-business notice; a fixed price explained in plain words.

## Page inventory

| Page | URL | Purpose | Primary keyword | Target `<title>` (≤60) | Status |
|---|---|---|---|---|---|
| Home | `/` | Say what it is, for whom, why it differs; route to services and contact | German to English technical translation | German to English Technical Translation \| Fernwood | [x] |
| Services | `/services` | The four document types, the terminology list, the pricing and the steps of a job | manual translation | Manual translation services \| Fernwood Technical Translation | [x] |
| About | `/about` | Jo: mechanical engineer who translates only machine documentation | Jo Fernwood | About Jo Fernwood \| Fernwood Technical Translation | [x] |
| Contact | `/contact` | How to ask for a fixed price: email link, phone, what to send | fixed price | Ask for a fixed price \| Fernwood Technical Translation | [x] |
| Privacy | `/privacy` | GDPR privacy policy | — | Privacy Policy \| Fernwood Technical Translation | [x] |

## Per-page-type copy template

There is no repeated page type (no blog, no collection). Each page:
- **Section order:** hero (H1 + one-sentence intro) → body sections → contact call to
  action.
- **Hero:** H1 names the page's positioning term; the intro sentence says the reader
  benefit.
- **Proof block:** none. There is no proof yet; explain the mechanism instead.
- **CTA:** one, repeated: "Ask for a fixed price" → `/contact`.

## New-page checklist

- [ ] Positioning term threaded (positioning.spec.ts) + ToV applied; tone + positioning tests green
- [ ] One `<h1>`; headings nest without skips
- [ ] `<title>` at most 60 chars incl. the suffix, `<meta description>` 120–160
- [ ] og/twitter inherit title/description; canonical set
- [ ] Required JSON-LD present (WebPage + page-specific)
- [ ] Images: WebP, sized to display, descriptive alt, lazy below the fold
- [ ] In sitemap; internal links clean (no `.html`)
- [ ] The fictional-business footer notice renders (it is in `Base.astro`)
