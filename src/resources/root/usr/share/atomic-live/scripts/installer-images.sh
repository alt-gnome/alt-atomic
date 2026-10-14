#!/usr/bin/env bash
# Offers the image embedded into the live ISO in the installer
set -euo pipefail

suffix= en= ru=
if [ "$BUILD" = nvidia ]; then
    suffix=-nvidia en=" with NVIDIA drivers" ru=" с драйверами NVIDIA"
fi
ref=altlinux.space/alt-atomic/onyx$suffix/$IMAGE_TYPE:latest
conf=/etc/atomic-installer/images.yml

if grep -qxF "  - image: docker://$ref" "$conf"; then
    sed -i "s|^  - image: docker://$ref\$|  - image: containers-storage:$ref\n    target: $ref|" "$conf"
else
    sed -i "s|^images:\$|images:\n  - image: containers-storage:$ref\n    target: $ref\n    title:\n      en: ALT Atomic Onyx (GNOME)$en\n      ru: ALT Atomic Onyx (GNOME)$ru\n|" "$conf"
fi
