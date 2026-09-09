#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

echo "== Git status =="
git status --short || true

echo
echo "== Status PDF =="
while IFS= read -r -d '' tex; do
  pdf="${tex%.tex}.pdf"
  rel="${tex#$ROOT/}"
  if [[ ! -f "$pdf" ]]; then
    echo "MISSING  $rel"
  elif [[ "$tex" -nt "$pdf" || ( -f "$ROOT/assets/itera_logo.png" && "$ROOT/assets/itera_logo.png" -nt "$pdf" ) ]]; then
    echo "STALE    $rel"
  else
    echo "OK       $rel"
  fi
done < <(find "$ROOT" -type f -name '*.tex' -not -path '*/.git/*' -print0)
