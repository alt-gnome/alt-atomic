#!/usr/bin/env bash
set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
METAINFO_DIR="$PROJECT_DIR/data"
PO_DIR="$PROJECT_DIR/po"
OUTPUT_DIR="$PROJECT_DIR/src/resources/files"
ITS_BASE="/usr/share/gettext/its/metainfo.its"
ITS_CUSTOM="/usr/share/gettext/its/atomic-variants.its"

CURRENT_DATE="$(date -u +%Y-%m-%d)"

command -v itstool >/dev/null
command -v msgfmt >/dev/null

for RULES in "$ITS_BASE" "$ITS_CUSTOM"; do
    if [[ ! -f "$RULES" ]]; then
        echo "Missing ITS rules: $RULES" >&2
        exit 1
    fi
done

mkdir -p "$OUTPUT_DIR"

TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

shopt -s nullglob
PO_FILES=("$PO_DIR"/*.po)
MO_FILES=()

# Compile translations.
for PO in "${PO_FILES[@]}"; do
    LANG="$(basename "$PO" .po)"
    MO="$TMP_DIR/$LANG.mo"

    msgfmt --check -o "$MO" "$PO"
    MO_FILES+=("$MO")
done

mapfile -d '' FILES < <(
    find "$METAINFO_DIR" -type f \
        -name '*.metainfo.xml.in' -print0 | sort -z
)

if (( ${#FILES[@]} == 0 )); then
    echo "No metainfo templates found" >&2
    exit 1
fi

for SOURCE in "${FILES[@]}"; do
    NAME="$(basename "$SOURCE" .in)"
    OUTPUT="$OUTPUT_DIR/$NAME"
    TEMPLATE="$TMP_DIR/$NAME"

    echo "Generating: $NAME"

    # Replace date in the template.
    sed "s/@DATE@/$CURRENT_DATE/g" \
        "$SOURCE" > "$TEMPLATE"

    if (( ${#MO_FILES[@]} > 0 )); then
        itstool -i "$ITS_BASE" -i "$ITS_CUSTOM" \
            -j "$TEMPLATE" \
            -o "$OUTPUT" \
            "${MO_FILES[@]}"

    else
        cp "$TEMPLATE" "$OUTPUT"
    fi

    # Replace date in translated strings too.
    sed -i "s/@DATE@/$CURRENT_DATE/g" "$OUTPUT"
done
