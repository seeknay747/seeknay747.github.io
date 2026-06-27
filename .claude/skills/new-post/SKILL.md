---
name: new-post
description: Scaffold a new Jekyll blog post for seeknay.com with the correct filename and front matter. Use when the user wants to start, create, draft, or add a new blog post.
---

# New Post

Create a new post in `_posts/` that matches this site's conventions.

## Steps

1. **Gather inputs** (ask the user only for what's missing):
   - **Title** (required) — the headline.
   - **Categories** (1–2) — prefer existing taxonomy: `identity`, `career-development`, `security`, `digital-safety`, `powershell`, `scripting`, `automation`, `tech`, `cybersecurity`, `blog`, `podcasts`. Lowercase-hyphenated.
   - **Tags** (2–6) — lowercase-hyphenated.
   - **Excerpt** (one sentence) — used in listings and social previews. Offer to draft one from the title.
   - **Long post?** — if yes, include `toc: true` / `toc_sticky: true`.

2. **Compute the filename**: `_posts/YYYY-MM-DD-<slug>.md`
   - Date = today (America/New_York). Get it with `date +%F` if unsure.
   - Slug = title lowercased, spaces → hyphens, strip punctuation/apostrophes.

3. **Write the file** with this front matter (drop `layout`/`comments`/`classes` — they come from `_config.yml` defaults):

   ```yaml
   ---
   title: "<Title>"
   date: <YYYY-MM-DD>T09:00:00-04:00
   categories:
     - <category>
   tags:
     - <tag>
   excerpt: "<one-sentence summary>"
   author_profile: true
   read_time: true
   share: true
   related: true
   toc: true            # only for long posts; omit otherwise
   toc_sticky: true     # only for long posts; omit otherwise
   last_modified_at: <YYYY-MM-DD>T09:00:00-04:00
   ---

   <!-- Draft body here. Use ## headings so the TOC populates. -->
   ```

4. **Confirm** the file path back to the user and offer to open it for writing the body.

## Guardrails
- Never set a future date in production-facing posts unless the user explicitly wants a scheduled/unpublished draft.
- Keep `title` in quotes (colons/apostrophes break YAML otherwise).
- Don't invent categories/tags wildly — reuse existing taxonomy where it fits.
- This is a PUBLIC repo: no private PII or secrets in the post.
- After creating, suggest the **publish-post** skill when the draft is ready.
