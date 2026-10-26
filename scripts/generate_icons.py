#!/usr/bin/env python3
"""Render the raster icon set from the same monogram as public/favicon.svg.

Writes public/favicon.ico (32x32), public/apple-touch-icon.png (180), public/icon-192.png,
public/icon-512.png, public/icon-maskable-512.png (monogram inside the safe zone) and
public/images/logo.png (512, used as the Organization logo in schema).
Run once after changing the monogram:  python3 scripts/generate_icons.py  (needs Pillow).
"""
from pathlib import Path
from PIL import Image, ImageDraw

ROOT = Path(__file__).resolve().parent.parent
PUB = ROOT / "public"
INK = (22, 22, 42)
WHITE = (255, 255, 255)
ACCENT = (138, 160, 255)


def monogram(size: int, maskable: bool = False) -> Image.Image:
    """The 64-unit favicon.svg drawing, scaled to `size` px (4x supersampled)."""
    s = size * 4
    img = Image.new("RGBA", (s, s), (0, 0, 0, 0))
    d = ImageDraw.Draw(img)
    if maskable:
        d.rectangle([0, 0, s, s], fill=INK)  # full bleed; the OS applies its own mask
        scale, off = s / 64 * 0.7, s * 0.15  # drawing inside the 70% safe zone
    else:
        d.rounded_rectangle([0, 0, s - 1, s - 1], radius=s * 12 / 64, fill=INK)
        scale, off = s / 64, 0

    def p(x, y):
        return (off + x * scale, off + y * scale)

    d.polygon([p(20, 14), p(46, 14), p(46, 22), p(29, 22), p(29, 29), p(44, 29),
               p(44, 37), p(29, 37), p(29, 50), p(20, 50)], fill=WHITE)
    d.rectangle([p(34, 44), p(46, 50)], fill=ACCENT)
    return img.resize((size, size), Image.LANCZOS)


def main() -> None:
    (PUB / "images").mkdir(parents=True, exist_ok=True)
    monogram(32).save(PUB / "favicon.ico", sizes=[(32, 32)])
    monogram(180, maskable=True).convert("RGB").save(PUB / "apple-touch-icon.png")
    monogram(192).save(PUB / "icon-192.png")
    monogram(512).save(PUB / "icon-512.png")
    monogram(512, maskable=True).save(PUB / "icon-maskable-512.png")
    monogram(512).save(PUB / "images/logo.png")
    print("icons written to public/")


if __name__ == "__main__":
    main()
