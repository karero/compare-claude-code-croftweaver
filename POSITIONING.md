<!--
  POSITIONING.md — per-site positioning, worked out FIRST (before SEO, before any
  page copy). Single source of truth for WHAT you offer, FOR WHOM, and the MARKET
  CATEGORY it sits in. Everything downstream reads this: CONTENT_GUIDE.md (voice/EEAT),
  every page title/description/H1, and the schema description. Built on April Dunford's
  framework (Obviously Awesome). Enforced by tests/positioning.spec.ts (the positioning
  spine). Owned by the website-positioning skill — do not restate positioning in
  CONTENT_GUIDE.md. Source of every fact here: BRIEF.md (the owner's brief).
-->
# Fernwood Technical Translation — positioning

## 1. Competitive alternatives

What the customer uses today instead:

- Machine translation, reviewed by one of their own engineers
- A large translation agency
- A generalist freelance translator

## 2. Unique attributes

- The translator is a trained mechanical engineer.
- Only machine documentation: operating manuals, maintenance instructions,
  specifications and safety notes, German into English. Nothing else.
- The client's own terminology list, used on every job and kept across jobs (the client
  sends one, or Jo builds one with them on the first job).
- Priced per word, with a fixed price agreed before work starts.

## 3. Value + proof

No client proof exists yet (no quotes, no figures, no references). The proof column
names the mechanism only. Do not add a metric or a quote until a real one exists.

| Unique attribute | Value it enables | Proof |
|---|---|---|
| Engineer who translates | Fewer review rounds for the client's own engineers | Mechanism: the translator understands the machine the text describes |
| Only machine documentation | Text that reads like an English manual, not a general translation | Mechanism: one document type, one subject area |
| Client terminology, kept across jobs | The same words for the same parts across every manual | Mechanism: one terminology list per client, reused on every job |
| Fixed price before work starts | The documentation budget is known before the job begins | Mechanism: per-word price, agreed in writing up front |

## 4. Target customer

- **Best-fit customer:** technical writers and documentation managers at small and
  mid-size machine builders in Germany.
- **Why they care most:** they sell machines abroad and need English manuals; every
  review round costs their own engineers' time, and inconsistent part names across
  manuals cause confusion.
- **Where they are:** Germany; the work is done online.

## 5. Market category

- **Market category:** technical translation for machine builders
  ← the home page's `body: [...]` entry in tests/positioning.spec.ts
- **Trap test:** "technical translation" is an established category in search
  (translation services for technical documents); no unrelated concept shares the
  phrase. Not run live for this build (no network research step); run
  `seo-reposition`'s trap test after launch if the site does not rank.
- **Familiar frame, as the foil (optional):** a translation agency (used only in the
  statement's "unlike").

## Positioning statement (one paragraph)

> For technical writers and documentation managers at small and mid-size German machine
> builders who need English manuals, Fernwood Technical Translation is a German to
> English technical translation service for machine builders that delivers manuals their
> engineers review in fewer rounds, with the same words for the same parts in every
> manual, unlike machine translation, a large agency or a generalist freelancer, because
> the translator is a mechanical engineer who translates only machine documentation,
> keeps each client's terminology across jobs and agrees a fixed price before starting.

- **Human version (optional):** "I trained as a mechanical engineer, and I translate one
  kind of text: German machine documentation into English. I use your terms, I keep them
  for the next manual, and you know the price before I start."
- **Core positioning term:** German to English technical translation
- **One-line boilerplate (≤ 12 words):** German to English technical translation for
  machine builders, by an engineer.
- **~50-word boilerplate:** Fernwood Technical Translation is Jo Fernwood, a mechanical
  engineer who translates technical documentation from German into English for machine
  builders: operating manuals, maintenance instructions, specifications and safety
  notes. Jo works from each client's own terminology, keeps it for every later job, and
  agrees a fixed price per word before work starts.

## The positioning spine (per-page terms → tests/positioning.spec.ts)

| Page | URL | Positioning term | Market category (home only) |
|---|---|---|---|
| Home | `/` | German to English technical translation | technical translation for machine builders |
| Services | `/services` | manual translation (title), German to English (desc, h1) | — |
| About | `/about` | mechanical engineer (desc, h1/intro); Jo Fernwood (title) | — |
| Contact | `/contact` | fixed price | — |

Use ONE term per page and repeat it across the three surfaces. Do not pad with
synonyms, and do not chase keyword density.

## Hand-off to the rest of the pipeline

- **Voice + EEAT + page copy:** `website-content-guide` reads this file.
- **Keyword / SERP research:** `seo-audit` — positioning leads, keywords follow.
- **AI / answer-engine phrasing (GEO):** `ai-seo`.
- **Schema `description` + head metadata:** `website-seo-geo` (the 50-word boilerplate).
