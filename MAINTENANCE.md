# A maintenance run: Claude Code with Croftweaver 0.34

This branch is one half of a second comparison, made on 31 October 2026 for croftweaver.com. The
site built in the first comparison (see `main`) was given one ordinary change: add a page from a
text and a photo the owner supplied. Three faults were planted in that material. The same change
was asked of the other site, built by Claude Code on its own:
https://github.com/karero/compare-claude-code-alone/tree/maintenance.

**The business is fictional.** Fernwood Technical Translation, Jo Fernwood and the contact details
(jo@example.com, +1 555 0142) are invented for the comparison.

## How this run was made

- Claude Code 2.1.308, model claude-opus-5-5, permission mode `acceptEdits`, in a fresh Claude Code
  configuration with the Croftweaver plugin 0.34.0 installed by the same route as in the first
  comparison. A dry start before the run showed what loaded: the site's own `CLAUDE.md` and
  `AGENTS.md`, its start-up hook, 19 built-in skills and 66 from Croftweaver, no MCP servers.
- The site keeps its 0.33 tests and bundled skills, as an owner's would. The experimenter copied in
  one file, the phone-images test from the 0.34 starter, as the 0.34 release notes tell an owner.
- The session ran in a Docker container (image digest
  `sha256:e7865e9e315f24cb521a2fe250e73d25994a1580d27becb300963132f4c1e8b9`: Playwright's Node
  image with Chromium, git, Claude Code and Python's Pillow). It saw only the site at `/site`, a
  local bare repository at `/remote.git` (its `origin`), the material at `/incoming` (read-only)
  and its own configuration. No GitHub or Cloudflare credentials were inside; the one credential
  was a Claude Code token made for the test and revoked afterwards.
- The harness is the first comparison's, with these changes: `git push` allowed (to `/remote.git`),
  `git push --no-verify`, `git remote add`, `git remote set-url` and `wrangler` denied (`gh` stays
  denied), `--add-dir /incoming`, and a four-hour deadline outside the session.
- The prompt: "Add a new page, "How a job works", to the site. The text and the photo are in the
  folder /incoming. Commit and push when it is done."
- Questions were answered from `BRIEF.md`, else "use your default"; a question whether to use the
  material as given got "Yes, add it as given; use your default for anything else." The run asked
  three questions, then one more, and got two answers (the second and third prompts in the
  transcript).
- The run ended when the assistant said it was done.

**A first attempt was stopped.** The first image had no Pillow, which the site's share-card script
needs (its `SETUP.md` lists it as an owner's tool). The session built and committed the page, found
it could not make the share card and asked. Told to use its default, it could not install Pillow
and stopped before pushing, since its pre-push check would refuse a failing test. That attempt pushed nothing. The image was rebuilt with Pillow and the run
started again from the same setup. The first attempt's transcript is
`TRANSCRIPT-maintenance-first-attempt.md` (0.78 USD).

## The material and the planted faults

`how-it-works.md` (five steps of a job) and `desk.jpg`. SHA-256:
`c89aa498109deccb1a61c5c4fe93fe387084034d58ab4f3bce619b98eadf1ff8` and
`0bf12ee6cf3fd69237ae2bdc09fe660b375e6ccbff283dda989a71e845441b27`. The photo is not a desk: it is
a rejected 1941 design for the town hall of Grou, by P. de Vries, held by Tresoar, CC0, from
https://commons.wikimedia.org/wiki/File:Ontwerp_Raadhuis_Grouw_afgewezen_-_P._de_Vries,_1941,_archiefnr_1875.jpg
(no CC0 desk photo that large was found without a logo). Its caption in the text, "The desk where
I translate", is therefore untrue.

| # | Fault | Present on the deployed page when |
|---|---|---|
| F1 | A link to `/service`; the page is `/services` | the W3C Link Checker reports it broken |
| F2 | The photo: 5194 × 3425 px, 2.2 MB | PageSpeed Insights (mobile) names it under "Improve image delivery" with a saving |
| F3 | "I price the job per page"; the brief and the site say per word | the page says per page |

## What the experimenter added, and nothing else

- Before the run, two commits: `416a4cb` "Experimenter: remove the first experiment's write-up,
  harness and measures", so the folder the assistant read was the site, not a comparison; and
  `eed8eff`, which adds `tests/phone-images.spec.ts` from the 0.34 starter.
- After it, this commit: this file, `TRANSCRIPT-maintenance.md` (the run) and
  `TRANSCRIPT-maintenance-first-attempt.md`, in plain text (tool results cut to 1,500 characters,
  except `git push` results, which are given in full; local paths replaced with labels). Nothing
  was withheld or blanked.
- The run's commit `b7b1466` is as it pushed it, on its own branch `content/how-a-job-works`; this
  `maintenance` branch starts there.
- The run changed `scripts/generate_og_cards.py`, `tests/_helpers.ts` and
  `tests/positioning.spec.ts`. The plan holds a deploy until such changes have been read; they were
  read and accepted before the deploy.
- The page was built in a fresh container and deployed by the experimenter with `wrangler pages
  deploy --branch maintenance`: https://maintenance.compare-cc-croftweaver.pages.dev/how-a-job-works
  (it carries the same `noindex` header as the first comparison).

## Results

**The run:** 3 turns (45 s, 155 s and 68 s), 33 model turns, 0.94 USD (Claude Code's own figure,
which adds up over resumed turns; the first attempt's 0.78 USD comes on top), 4 questions (per page
or per word; "I" or "Jo"; where to link the page; then the photo is not a desk), 2 permission
denials (a shell command with a here-document, refused by Claude Code's parser; `git remote -v &&
gh auth status`, refused because `gh` is denied). Checks run: `npm run verify` ("157 passed",
"verify: all green"), then the pre-push hook on the push. Push: `git push -u origin
content/how-a-job-works`, which printed "157 passed", "pre-push gate passed — pushing." and
`* [new branch]`. `core.hooksPath` is `scripts/hooks`. It did not push to `main`, and could not open
a pull request (`gh` is denied); it said so.

**Per fault.** "First named by" is whichever comes first in the transcript: a check's output, or a
message from the assistant. "End state" is fixed (gone from the page), reported (still there, and
the assistant told the owner it is a problem) or left in silently.

| # | First named by | End state |
|---|---|---|
| F1 | the assistant, turn 1's last message, before any check ran: "Your link to `/service` doesn't exist. I'll point it at `/services`." | fixed: the link goes to `/services`; the Link Checker's one 404 is the page's canonical link (below), not this link |
| F2 | the assistant, same message: "The photo is 5194×3425 px and 2.2 MB. I'll convert it to WebP in a few display sizes." | fixed: WebP at 480, 800 and 1200 px (13 to 49 KB); PageSpeed's phone loaded the 800 px copy, 27.2 KiB; PageSpeed's image audit passes |
| F3 | the assistant, same message: "Your text says "I price the job per page". Everywhere else the site says per word" | fixed: "per word" |

**Its own wording test.** The run added the new page to `tests/positioning.spec.ts`, the site's
test of which words each page must carry: the title must say "How a job works", the description
"fixed price", the body "fixed price" and "terminology list". It does not check the price unit, so
it would not catch F3.

The run asked about the photo after its tests passed, then, on "add it as given", kept the photo
but changed the alt text to "An old blueprint of a building's main floor, with rooms labelled in
Dutch", which describes it.

**On the deployed page** (https://maintenance.compare-cc-croftweaver.pages.dev/how-a-job-works):

- PageSpeed Insights, mobile, five runs (Lighthouse 13.6.0, 2 November): 100 / 100 / 100 / 69 in
  every run (performance, accessibility, best practices, SEO; SEO is 69 because of the `noindex`
  header). "Improve image delivery" passed in all five. Page weight 33 KiB.
- W3C Nu HTML Checker: no errors; one note ("Section lacks heading").
- W3C Link Checker: one 404, the page's canonical link,
  https://compare-cc-croftweaver.pages.dev/how-a-job-works. That is the production address, where
  this page was never deployed. Run 1's canonical link answers 404 at its production address too;
  the checker did not report it there.
- From the built HTML: title "How a job works | Fernwood Technical Translation" (48 characters),
  description 156 characters, a canonical link, in the sitemap, linked from the main menu, a line in
  `llms.txt` and its own share card.

One run each is an anecdote, not a measurement. The limits are listed with the results at
https://croftweaver.com/compare.
