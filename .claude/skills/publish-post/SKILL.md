---
name: publish-post
description: Validate, build, and open a pull request for a finished seeknay.com blog post or site change. Use when the user wants to publish, ship, release, or PR a post/change. Never pushes directly to master.
---

# Publish Post

Take a finished change from the working tree to a reviewable PR. `master` is the deploy
branch and is protected — **always go through a PR, never push to `master` directly.**

## Steps

1. **Validate front matter**:
   ```bash
   ruby script/check_front_matter.rb
   ```
   Fix any reported issues before continuing.

2. **Build locally** (catches Liquid/YAML errors the same way CI will):
   ```bash
   JEKYLL_ENV=production bundle exec jekyll build
   ```
   Optionally run the link/image check:
   ```bash
   bundle exec htmlproofer ./_site --disable-external --allow-hash-href --ignore-missing-alt
   ```

3. **Branch** off `master` if not already on a feature branch:
   ```bash
   git checkout -b post/<slug-or-topic>
   ```

4. **Commit** with a conventional message:
   ```bash
   git add -A
   git commit -m "feat(blog): <post title>"
   ```
   (Use `chore:`/`fix:`/`docs:` for non-post changes.)

5. **Push and open a PR**:
   ```bash
   git push -u origin HEAD
   gh pr create --base master --fill
   ```
   CI (build + front-matter + HTML-Proofer) runs on the PR. The PR must be green before merge.

6. **Report** the PR URL back to the user. After they merge, GitHub Pages publishes from
   `master` automatically — then suggest the **share-post** skill.

## Guardrails
- Never `git push` to `master` directly; never use `--no-verify` or bypass branch protection.
- Confirm the working tree contains only intended changes (`git status`) before committing.
- This is a PUBLIC repo: re-check the diff for secrets/PII before pushing.
- If the build or checks fail, stop and surface the error — don't force the PR through.
