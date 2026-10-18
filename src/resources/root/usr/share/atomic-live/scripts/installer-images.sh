#!/usr/bin/env bash
# Offers both Onyx images embedded into the live ISO in the installer.
set -euo pipefail

conf=${ATOMIC_INSTALLER_IMAGES_FILE:-/etc/atomic-installer/images.yml}

for suffix in "" -nvidia; do
    ref=altlinux.space/alt-atomic/onyx$suffix/$IMAGE_TYPE:latest
    pattern="^  - image: docker://altlinux[.]space/alt-atomic/onyx$suffix/[^[:space:]]+\$"

    if ! grep -qE "$pattern" "$conf"; then
        echo "Onyx$suffix image not found in $conf" >&2
        exit 1
    fi

    sed -i -E "s|$pattern|  - image: containers-storage:$ref\n    target: $ref|" "$conf"
done
