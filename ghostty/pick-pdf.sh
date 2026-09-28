#!/usr/bin/env bash
# Ghostty port of ~/.config/kitty/pick-pdf.sh (uses fzf instead of kitten choose_files).
set -euo pipefail

dir=${1:-"$HOME"}
script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

if ! command -v fzf >/dev/null 2>&1; then
  echo "fzf is required to pick a PDF." >&2
  exit 1
fi

if command -v fd >/dev/null 2>&1; then
  file=$(fd -e pdf -e PDF . "$dir" 2>/dev/null | fzf --prompt 'PDF> ') || true
else
  file=$(find "$dir" -type f \( -iname '*.pdf' \) 2>/dev/null | fzf --prompt 'PDF> ') || true
fi

[[ -z "${file:-}" ]] && exit 0

exec "$script_dir/view-pdf.sh" "$file"
