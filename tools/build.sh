#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
FORCE=0
[[ "${1:-}" == "--force" ]] && FORCE=1

if ! command -v latexmk >/dev/null 2>&1; then
  echo "[ERROR] latexmk tidak ditemukan. Install MacTeX/TeX Live untuk compile lokal."
  exit 127
fi

count=0
while IFS= read -r -d '' tex; do
  dir="$(dirname "$tex")"
  base="$(basename "$tex")"
  stem="${base%.tex}"
  pdf="${tex%.tex}.pdf"
  stale=0

  if [[ $FORCE -eq 1 || ! -f "$pdf" || "$tex" -nt "$pdf" ]]; then
    stale=1
  elif [[ -f "$ROOT/assets/itera_logo.png" && "$ROOT/assets/itera_logo.png" -nt "$pdf" ]]; then
    stale=1
  fi

  if [[ $stale -eq 1 ]]; then
    echo "[BUILD] ${tex#$ROOT/}"
    tmp_log="$(mktemp "${TMPDIR:-/tmp}/mat3-latex.XXXXXX")"
    if ! (cd "$dir" && latexmk -pdf -interaction=nonstopmode -halt-on-error "$base") >"$tmp_log" 2>&1; then
      cat "$tmp_log"
      rm -f "$tmp_log"
      exit 1
    fi
    rm -f "$tmp_log"
    (
      cd "$dir"
      latexmk -c "$base" >/dev/null 2>&1 || true
      rm -f "$stem.aux" "$stem.bbl" "$stem.bcf" "$stem.blg" \
            "$stem.fdb_latexmk" "$stem.fls" "$stem.log" "$stem.nav" \
            "$stem.out" "$stem.run.xml" "$stem.snm" "$stem.toc" \
            "$stem.vrb" "$stem.synctex.gz"
    )
    count=$((count+1))
  else
    echo "[OK]    ${tex#$ROOT/}"
  fi
done < <(find "$ROOT" -type f -name '*.tex' -not -path '*/.git/*' -print0)

echo "Selesai. $count source dikompilasi."
