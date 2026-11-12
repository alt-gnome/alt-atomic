#!/usr/bin/env bash
set -euo pipefail

conf=${ATOMIC_INSTALLER_IMAGES_FILE:-/etc/atomic-installer/images.yml}

# Replace stable with nightly for all Onyx images.
if [[ ${IMAGE_TYPE:-} == "nightly" ]]; then
    sed -i -E \
        '/^[[:blank:]]*(-[[:blank:]]+image:|target:)[[:blank:]]+/ s|(altlinux[.]space/alt-atomic/onyx(-[^/[:space:]]+)?/)stable(:[^[:space:]]+)?|\1nightly\3|' \
        "$conf"
fi

# Replace Onyx image sources with local container storage.
sed -i -E \
    's|^([[:blank:]]*)-[[:blank:]]+image:[[:blank:]]+(docker://)?(altlinux[.]space/alt-atomic/onyx(-[^/[:space:]]+)?/[^[:space:]]+)[[:blank:]]*$|\1- image: containers-storage:\3\n\1  target: \3|' \
    "$conf"
