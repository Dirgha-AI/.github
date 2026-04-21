#!/usr/bin/env bash
# One-time deployment script for the dirghaai org-wide community-health repo
# and teams. Run this when you have a GitHub token with admin:org + write:org
# scope. Rerun-safe.
#
# Usage:
#   gh auth refresh -s admin:org,write:org
#   bash ./FINISH_DEPLOYMENT.sh

set -euo pipefail

ORG="dirghaai"
REPO_DIR="$(cd "$(dirname "$0")" && pwd)"

have_scope() {
  local needed="$1"
  gh auth status 2>&1 | grep -q "$needed" || {
    echo "ERROR: token missing scope '$needed'."
    echo "Run: gh auth refresh -s admin:org,write:org"
    exit 1
  }
}

step() { echo; echo "▶ $*"; }

step "Preflight"
have_scope "admin:org"
have_scope "write:org"

step "1/3 — Create dirghaai/.github repo (public)"
if gh repo view "$ORG/.github" >/dev/null 2>&1; then
  echo "   already exists — pushing updates"
  cd "$REPO_DIR"
  git remote get-url origin >/dev/null 2>&1 || git remote add origin "git@github.com:$ORG/.github.git"
  git push -u origin main
else
  cd "$REPO_DIR"
  gh repo create "$ORG/.github" --public --source=. --push \
    --description "Community-health defaults for the dirghaai organization"
fi

step "2/3 — Create @dirghaai/maintainers team"
if gh api "orgs/$ORG/teams/maintainers" >/dev/null 2>&1; then
  echo "   already exists"
else
  gh api "orgs/$ORG/teams" \
    -f name="maintainers" \
    -f description="Code owners across all dirghaai repositories" \
    -f privacy="closed" >/dev/null
  echo "   created"
fi

step "3/3 — Create @dirghaai/docs team"
if gh api "orgs/$ORG/teams/docs" >/dev/null 2>&1; then
  echo "   already exists"
else
  gh api "orgs/$ORG/teams" \
    -f name="docs" \
    -f description="Documentation maintainers across all dirghaai repositories" \
    -f privacy="closed" >/dev/null
  echo "   created"
fi

step "Done"
echo
echo "Follow-ups you still have to do by hand:"
echo "  - Add members to the two teams: gh api -X PUT orgs/$ORG/teams/maintainers/memberships/<login>"
echo "  - Flip each of the 5 release repos from Private to Public when ready"
echo "  - Create 5–10 'good first issue' labels on real gaps in each repo"
echo "  - Replace the BTC Lightning placeholder in www/src/pages/contribute.astro"
