<!--
  BRAND.md — per-site brand & visual guide. Pairs with CONTENT_GUIDE.md (what it says).
  The colour source of truth is the theme-token block in src/styles/global.css; keep
  this file and that block in sync. No colours or logo were supplied (BRIEF.md): these
  are the Croftweaver starter defaults plus a text monogram.
-->
# Fernwood Technical Translation — brand & style guide

## Brand in one line

German to English technical translation by an engineer, presented like a well-made
manual: white space, one blue accent, system type, no stock photography.

## Logo

- File: `public/favicon.svg` (a square "F" monogram on the ink colour, 64×64 viewBox).
  The header shows the name as text; there is no separate logo artwork.
- Clearspace: keep free space ≥ 30% of the logo height around it.
- Minimum size: 16px tall (favicon).
- On dark backgrounds: the monogram has its own dark square, so it reads on both.

## Colour palette

Every text/background pair MUST pass **WCAG AA (4.5:1 body, 3:1 large)** in BOTH themes
— the a11y test checks this.

### Brand (fixed, theme-independent)
| Token | Hex | Use |
|---|---|---|
| Primary | `#16162a` | monogram, theme colour, share cards |

### Light theme
| Token | Hex |
|---|---|
| Heading | `#16162a` |
| Body (ink) | `#16162a` |
| Muted | `#5a5a72` |
| Accent | `#2b50e0` |
| Link | `#2b50e0` |
| Hairline | `#e3e7f2` |
| Background | `#ffffff` |
| Soft background | `#f5f7fb` |
| Surface (cards) | `#ffffff` |

### Dark theme
| Token | Hex |
|---|---|
| Heading | `#e7e9fb` |
| Body (ink) | `#dce0f5` |
| Muted | `#a6abce` |
| Accent | `#8aa0ff` |
| Link | `#9fb0ff` |
| Hairline | `#272c4d` |
| Background | `#0a0b1e` |
| Soft background | `#11132c` |
| Surface (cards) | `#161836` |

## Typography

- Family: system stack (`system-ui, -apple-system, "Segoe UI", Roboto, Helvetica,
  Arial, sans-serif`). No web fonts, so nothing to preload and no third-party request.
- Headings: weight 700, tracking ≈ −0.02em.
- Body: weight 400, line-height ≈ 1.65.

## Shape & spacing

- Corner radius: 12px. Soft shadow: `0 1px 2px rgba(0,0,0,0.06), 0 8px 24px rgba(0,0,0,0.06)`.
- Max content width: 72rem; running text max 40rem.

## Mobile & graphics rules (the website-design-system skill)

- **Responsive images:** serve WebP (or AVIF); `srcset`/`sizes`; explicit
  `width`/`height`. (The site ships no content images today.)
- **Lazy-load** below-the-fold images; eager-load the LCP image.
- **Every image has descriptive `alt`** (or `alt=""` if purely decorative).
- **Mobile first:** design at 360px up; tap targets ≥ 44px; no horizontal scroll.

## OG / share image spec (1200 × 630)

Drives `scripts/generate_og_cards.py` (`npm run og`):
1. Canvas 1200×630, dark gradient from the primary ink tone to near-black.
2. Logo: none (text-only cards).
3. Wordmark "Fernwood Technical Translation", top-left, white.
4. Headline: the page's title, white; subtitle lines in the dark-theme accent.
5. Footer URL `compare-cc-croftweaver.pages.dev`, muted.

Per-page variants change only the headline and subtitles. ≤ 300 KB JPEG.

## Imagery style (do / don't)

- **Do:** plain type, white space, legible in both themes.
- **Don't:** stock photos of handshakes or flags, globes, AI "robot/brain" clichés,
  photos of machines the business has not worked on.
