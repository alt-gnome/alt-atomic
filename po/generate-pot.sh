#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"
SOURCE_DIR="$PROJECT_DIR/data"
POT="$SCRIPT_DIR/onyx.pot"
ITS_BASE="/usr/share/gettext/its/metainfo.its"
ITS_CUSTOM="/usr/share/gettext/its/atomic-variants.its"

command -v itstool >/dev/null

for RULES in "$ITS_BASE" "$ITS_CUSTOM"; do
    if [[ ! -f "$RULES" ]]; then
        echo "Missing ITS rules: $RULES" >&2
        exit 1
    fi
done

mapfile -d '' FILES < <(
    find "$SOURCE_DIR" -type f \
        -name '*.metainfo.xml.in' -print0 | sort -z
)

itstool -i "$ITS_BASE" -i "$ITS_CUSTOM" -o "$POT" "${FILES[@]}"

echo "Updated: $POT"
