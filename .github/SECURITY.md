# Security Policy

This repository holds the source for a personal static blog ([seeknay.com](https://seeknay.com))
hosted on GitHub Pages. There is no server-side application, database, or user data
processed here — but responsible reports are still welcome.

## Reporting a vulnerability

**Please do not open a public issue for security reports.**

Use **GitHub's private vulnerability reporting** for this repository:
[Report a vulnerability](https://github.com/pbuffolino/seeknay747.github.io/security/advisories/new).

Alternatively, reach out through one of the contact links on
[seeknay.com](https://seeknay.com).

Please include:

- A description of the issue and where it appears (URL or file path).
- Steps to reproduce, if applicable.
- Any suggested remediation.

You can expect an acknowledgement within a few days. Since this is a static site,
most reports will relate to dependency advisories, leaked content, or misconfiguration.

## Scope

In scope:

- Secrets, credentials, or private PII accidentally committed to the repo or its history.
- Vulnerable dependencies (tracked via Dependabot).
- Misconfigurations in the build/deploy pipeline.

Out of scope:

- Issues in third-party platforms linked from the site (social networks, etc.).
- The Minimal Mistakes theme upstream — report those to
  [mmistakes/minimal-mistakes](https://github.com/mmistakes/minimal-mistakes).
