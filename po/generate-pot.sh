#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"
SOURCE_DIR="$PROJECT_DIR/src/resources/metainfo"
POT="$SCRIPT_DIR/metainfo.pot"

mapfile -d '' FILES < <(
    find "$SOURCE_DIR" -type f \
        -name '*.metainfo.xml.in' -print0 | sort -z
)

if (( ${#FILES[@]} == 0 )); then
    echo "No metainfo templates found" >&2
    exit 1
fi

itstool -o "$POT" "${FILES[@]}"

echo "Updated: $POT"
