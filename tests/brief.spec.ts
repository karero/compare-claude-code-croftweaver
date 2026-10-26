import { test, expect } from '@playwright/test';
import { PAGES } from './_helpers';

// Site-specific rules from BRIEF.md:
//  1. Every page says, in its footer, that the business is fictional (exact wording).
//  2. Only the brief's contact data appears: one email address, one phone number.
const NOTICE = 'A fictional business, built for a comparison. Not a real service.';
const EMAIL = 'jo@example.com';
const PHONE = '+1 555 0142';

for (const path of [...PAGES, '/404']) {
  test(`brief — footer notice and contact data on ${path}`, async ({ page }) => {
    await page.goto(path);
    const footer = page.locator('footer.site-footer');
    await expect(footer).toHaveCount(1);
    await expect(footer).toContainText(NOTICE);

    const text = await page.locator('body').innerText();
    const emails = [...new Set(text.match(/[\w.+-]+@[\w-]+\.[\w.]+/g) ?? [])];
    expect(emails.filter((e) => e !== EMAIL), 'email addresses other than the brief\'s').toEqual([]);
    const mailtos = (await page.locator('a[href^="mailto:"]').evaluateAll((as) =>
      as.map((a) => a.getAttribute('href') ?? ''))).map((h) => decodeURIComponent(h.slice(7).split('?')[0]));
    expect(mailtos.filter((e) => e !== EMAIL), 'mailto links other than the brief\'s').toEqual([]);
    const phones = [...new Set(text.match(/\+\d[\d ]{6,}\d/g) ?? [])];
    expect(phones.filter((p) => p.replace(/\s+/g, ' ') !== PHONE), 'phone numbers other than the brief\'s').toEqual([]);
    for (const a of await page.locator('a[href^="tel:"]').all()) {
      expect(await a.getAttribute('href')).toBe('tel:+15550142');
    }
  });
}
