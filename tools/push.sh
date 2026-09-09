#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
MSG="${1:-Update materi Matematika 3}"

bash "$ROOT/tools/build.sh"
cd "$ROOT"
git add -A
if git diff --cached --quiet; then
  echo "Tidak ada perubahan untuk di-push."
  exit 0
fi
git commit -m "$MSG"
git push origin main
