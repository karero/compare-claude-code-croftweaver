# Measurements of both comparison sites

The same files are in both repositories. Taken by the experimenter after both runs, on the deployed
sites https://compare-cc-alone.pages.dev (run 1, Claude Code on its own) and
https://compare-cc-croftweaver.pages.dev (run 2, with Croftweaver), home and contact pages.

- `w3c-*.json`: the W3C Nu HTML Checker's raw JSON (2026-10-26). `alone-` is run 1, `cw-` is run 2.
- `rrt-*.txt`: Google's Rich Results Test, written down from the tool's page (2026-10-26, and
  2026-10-28 for the item detail of run 2's home page). The tool keeps no public report link.
- `pagespeed/runs.jsonl`: PageSpeed Insights on mobile, five runs per page (2026-10-27,
  Lighthouse 13.5.0), each with its four scores, the time and the link to its report on
  pagespeed.web.dev. The API's anonymous quota was used up, so the website was used and its raw JSON
  was not downloaded.
- `NOTES.txt`: what went wrong along the way, as it happened.

Both sites send a noindex header, added by the experimenter, so Google's tools say the pages are not
available for indexing; crawling and fetching were allowed.
