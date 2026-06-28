---
name: share-post
description: Draft platform-tailored social copy (Bluesky, Twitter/X, LinkedIn, TikTok) to promote a published seeknay.com blog post. Use when the user wants to share, promote, or announce a post on social media.
---

# Share Post

Generate ready-to-paste promotional copy for a given post. **Output only — never post anything.**

## Steps

1. **Identify the post**: take a `_posts/...md` path or a live URL from the user.
2. **Read the post** front matter to get `title`, `excerpt`, `categories`, and the slug.
3. **Build the canonical URL**: `https://seeknay.com/<first-category>/<slug>/`
   - Permalink pattern is `/:categories/:title/`. Use the **first** category and the filename slug (without the date).
   - If unsure the URL resolves, confirm against the live site before sharing.
4. **Draft copy for each platform** using the title + excerpt. Match the author's voice (practical, security/identity-focused, approachable). Vary the hook per platform — don't paste identical text everywhere.

   - **Bluesky** (~300 chars): hook + value + URL + 1–2 hashtags.
   - **Twitter/X** (~280 chars): tighter hook + URL + 1–2 hashtags.
   - **LinkedIn** (longer, professional): 2–3 sentences of context, a takeaway, URL, a few hashtags (`#IAM #IdentitySecurity #CyberSecurity` as relevant).
   - **TikTok caption**: short, casual hook + a call to check the link in bio (TikTok doesn't allow clickable post links).

5. **Suggest hashtags** drawn from the post's tags/categories.

## Guardrails
- Don't fabricate stats or claims not in the post.
- Keep within each platform's character limits.
- Output the drafts in a clear per-platform block so they're easy to copy.
- Do not auto-post; the user shares manually.
