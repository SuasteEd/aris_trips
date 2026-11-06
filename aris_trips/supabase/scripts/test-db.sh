#!/usr/bin/env bash
# Runs the pgTAP tests in supabase/tests against the linked project without
# Docker. `supabase test db` needs a container to run pg_prove; this script
# sends each test through `supabase db query --linked` (Management API).
#
# tap_wrap.py turns each test into a function that runs inside a
# subtransaction that is always rolled back, so nothing is left in the
# database. The function returns the TAP lines produced before the rollback.
#
# Usage: supabase/scripts/test-db.sh [test files...]
set -euo pipefail

root="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$root"

if [[ $# -gt 0 ]]; then
  files=("$@")
else
  files=(supabase/tests/*.test.sql)
fi

tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT

failed=0
total_ok=0
total_not_ok=0

for file in "${files[@]}"; do
  python3 -I "$root/supabase/scripts/tap_wrap.py" "$file" > "$tmp/run.sql"

  echo "# $file"
  out="$(supabase db query --linked -f "$tmp/run.sql" --output-format json 2>/dev/null)" || {
    echo "not ok - could not run $file" >&2
    supabase db query --linked -f "$tmp/run.sql" 2>&1 | tail -5 >&2 || true
    failed=1
    continue
  }

  lines="$(printf '%s' "$out" | python3 -c '
import json, sys
data = json.load(sys.stdin)
rows = data if isinstance(data, list) else data.get("rows") or data.get("result") or []
for row in rows:
    print(row["tap"] if isinstance(row, dict) else row)
' | grep -E '^(ok|not ok|#)' || true)"
  printf '%s\n' "$lines"

  ok_count="$(printf '%s\n' "$lines" | grep -c '^ok ' || true)"
  not_ok_count="$(printf '%s\n' "$lines" | grep -c -E '^not ok|^# Looks like' || true)"
  total_ok=$((total_ok + ok_count))
  total_not_ok=$((total_not_ok + not_ok_count))
  if [[ "$not_ok_count" -gt 0 || "$ok_count" -eq 0 ]]; then
    failed=1
  fi
done

echo "# passed: $total_ok, failed: $total_not_ok"
exit "$failed"
