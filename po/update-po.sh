#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
POT="$SCRIPT_DIR/onyx.pot"

if [[ ! -f "$POT" ]]; then
    echo "Missing POT: $POT" >&2
    exit 1
fi

shopt -s nullglob

for PO in "$SCRIPT_DIR"/*.po; do
    echo "Updating: $(basename "$PO")"
    msgmerge --update --backup=none "$PO" "$POT"
done
