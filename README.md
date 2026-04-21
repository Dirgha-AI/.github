# `dirghaai/.github` — org-level defaults

This directory is the source of truth for files that GitHub applies as **org-wide defaults** to every repository under the `dirghaai` organization.

## How to deploy

Push this directory as the root of a repository literally named `.github`:

```bash
# From this directory
git init
git add .
git commit -m "chore: initial org-level community-health files"
git branch -M main
git remote add origin git@github.com:dirghaai/.github.git
git push -u origin main
```

Once this repo exists:

- `profile/README.md` becomes the **org landing page** at https://github.com/dirghaai.
- `CODE_OF_CONDUCT.md`, `SECURITY.md`, `SUPPORT.md`, `CONTRIBUTING.md`, `.github/FUNDING.yml`, and `.github/ISSUE_TEMPLATE/*` become **default versions** for every repo in the org that doesn't ship its own copy.
- Individual repos can override any file by adding a repo-level copy. This is desirable for things like `CODEOWNERS` (repo-specific by definition) and `LICENSE` (license varies per repo).

## What goes here vs in each repo

| File | Here (org default) | Per-repo override expected? |
|---|---|---|
| `CODE_OF_CONDUCT.md` | ✅ single version | Rarely |
| `SECURITY.md` | ✅ generic + policy | Yes, if repo has a non-standard scope |
| `SUPPORT.md` | ✅ org-wide "where to ask" | Yes, for repo-specific channels |
| `CONTRIBUTING.md` | ✅ DCO + CLA + commit style | Yes, when per-repo recipes exist |
| `.github/FUNDING.yml` | ✅ org-level sponsor button | No |
| `.github/ISSUE_TEMPLATE/*` | ✅ generic templates | Yes, when a repo needs more specificity |
| `profile/README.md` | ✅ org landing page | N/A (only in `.github` repo) |
| `LICENSE` / `LICENSING.md` / `NOTICE.md` | ❌ varies by repo | Always per-repo |
| `CODEOWNERS` | ❌ varies by repo | Always per-repo |
| `pull_request_template.md` | ⚠️ generic ok, most repos will override | Frequently |

## Repos that benefit today

- `dirghaai/dirgha-code` — the CLI. Has a full repo-level override set for templates, CODEOWNERS, and LICENSING. Inherits org-level CoC + SUPPORT.
- Future: `dirghaai/website`, `dirghaai/mobile`, `dirghaai/examples`, `dirghaai/docs`, `dirghaai/llm-router` (if spun out of the monorepo), any repo for an individual extension or SDK.

## Maintenance

When something in here changes (e.g., security contact moves, CoC revised), it propagates to every repo in the org on the next page view. No per-repo PRs needed for baseline community-health updates. That's the whole point.

## Not included

This repo **does not** contain source code. Org-level repos should stay small, stable, and obvious. For actual product code, use the product repos.
