#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
MSG="${1:-Sync materi Matematika 3}"

git -C "$ROOT" pull --rebase
bash "$ROOT/tools/build.sh"
cd "$ROOT"
git add -A
if ! git diff --cached --quiet; then
  git commit -m "$MSG"
  git push origin main
else
  echo "Sudah sinkron; tidak ada perubahan."
fi
