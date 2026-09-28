#!/usr/bin/env bash
# Same as ~/.config/kitty/view-pdf.sh — Kitty/Ghostty graphics protocol PDF viewers.
set -euo pipefail

if [[ $# -lt 1 || ! -f "$1" ]]; then
  echo "Usage: view-pdf.sh /path/to/file.pdf" >&2
  exit 2
fi

pdf=$1

for cmd in termpdf-cli meowpdf fancy-cat termpdf; do
  if command -v "$cmd" >/dev/null 2>&1; then
    exec "$cmd" "$pdf"
  fi
done

cat >&2 <<'EOF'
No Kitty/Ghostty-compatible PDF viewer found in PATH.

Install one of: termpdf-cli, meowpdf, fancy-cat, or termpdf.
See ~/.config/kitty/view-pdf.sh for links.
EOF
exit 1
