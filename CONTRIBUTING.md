# Contributing to Dirgha AI projects

This document is the default contribution guide for all repositories under the
[`dirghaai` GitHub organization](https://github.com/dirghaai). Individual repos
may ship their own `CONTRIBUTING.md` with project-specific details that override
this default.

## Ground rules

- **DCO sign-off**: Every commit must include a `Signed-off-by` line (`git commit -s`).
- **CLA required**: Larger contributions require signing the project's Contributor License Agreement. Check the individual repo's `CLA.md` — small fixes and typo corrections typically don't.
- **Small, focused PRs**: One concern per PR. A "big bang" PR bounces on review every time.
- **Tests required**: Every code change includes appropriate test coverage.
- **No `--no-verify`**: Don't bypass pre-commit hooks or CI checks. If they fail, fix the underlying issue.
- **Conventional commits**: Use `feat:`, `fix:`, `docs:`, `chore:`, `refactor:`, `test:`, or `perf:` as the prefix.

## Workflow

1. Fork the repository and create your branch from `main`.
2. Name your branch `feat/<slug>`, `fix/<slug>`, or `docs/<slug>`.
3. Make your change. Keep commits atomic and signed (`git commit -s`).
4. Ensure tests and lint pass locally.
5. Open a PR against `main`. Fill out the PR template.
6. Respond to review comments within a week, or let us know if you need more time.

## Code of Conduct

Participation in any `dirghaai` project is governed by our [Code of Conduct](CODE_OF_CONDUCT.md). Report issues to `conduct@dirgha.ai`.

## Security

For security vulnerabilities, see [SECURITY.md](SECURITY.md). Do not open public issues for security problems.

## Where to ask

- `how do I…` or `does X support…` → GitHub Discussions on the specific repo.
- Bug or crash → GitHub Issue using the bug template.
- Feature request → GitHub Issue using the feature template.
- Commercial or enterprise use → `enterprise@dirgha.ai`.
- General, press, partnerships → `hello@dirgha.ai`.

## Licensing

Each repository specifies its own license in its `LICENSE` file. Common choices across the org:

- `dirgha-code` — FSL-1.1-MIT. See the repo's `LICENSING.md` for rationale.
- Most other repos — Apache 2.0.

All contributions are accepted under the repository's existing license.
