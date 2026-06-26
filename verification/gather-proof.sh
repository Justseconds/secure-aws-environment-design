#!/usr/bin/env bash
#
# gather-proof.sh
# Collects READ-ONLY evidence that the AWS foundation is set up, redacting
# account IDs and email addresses. Writes to ./evidence/ (which is gitignored).
#
# Prereqs:
#   - AWS CLI v2 installed and authenticated (e.g. `aws sso login`).
#   - You are pointed at the account you want to prove (check with the
#     caller-identity output).
#
# Usage:
#   chmod +x gather-proof.sh
#   ./gather-proof.sh
#
# SAFETY: Redaction is best-effort, NOT a guarantee. Open every file in
#         ./evidence/ and confirm it is clean before sharing anywhere public.

set -uo pipefail

OUT="evidence"
mkdir -p "$OUT"

# Discover the account ID so we can redact it everywhere it appears.
ACCOUNT_ID="$(aws sts get-caller-identity --query Account --output text 2>/dev/null || echo "")"

redact() {
  # Redact any 12-digit account IDs and any email addresses.
  sed -E \
    -e "s/${ACCOUNT_ID:-000000000000}/ACCOUNT_ID_REDACTED/g" \
    -e 's/[0-9]{12}/ACCOUNT_ID_REDACTED/g' \
    -e 's/[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}/EMAIL_REDACTED/g'
}

run() {
  # run <label> <aws command...>
  local label="$1"; shift
  local file="$OUT/${label}.txt"
  {
    echo "# $label"
    echo "# captured (UTC): $(date -u +%Y-%m-%dT%H:%M:%SZ)"
    echo
  } > "$file"

  if "$@" 2>"$OUT/.err" | redact >> "$file"; then
    echo "  [ok]      $label"
  else
    echo "  [skipped] $label  (service not enabled, or no permission)"
    echo "(not available — service may be off or permission missing)" | redact >> "$file"
  fi
  rm -f "$OUT/.err"
}

echo "Gathering evidence into ./$OUT/  (redacting account ID + emails)..."
echo

run "caller-identity"      aws sts get-caller-identity
run "account-summary"      aws iam get-account-summary
run "cloudtrail-trails"    aws cloudtrail describe-trails
run "guardduty-detectors"  aws guardduty list-detectors
run "budgets"              aws budgets describe-budgets --account-id "$ACCOUNT_ID"
run "organizations"        aws organizations list-accounts
run "access-analyzers"     aws accessanalyzer list-analyzers
run "identity-center"      aws sso-admin list-instances

echo
echo "Done."
echo "NEXT: open each file in ./$OUT/ and confirm it is clean BEFORE sharing."
echo "      ./evidence/ is gitignored, so nothing here is committed automatically."
