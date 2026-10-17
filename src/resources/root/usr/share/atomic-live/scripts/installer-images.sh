#!/usr/bin/env bash
# Offers both images embedded into the live ISO in the installer
set -euo pipefail

conf=${ATOMIC_INSTALLER_IMAGES_FILE:-/etc/atomic-installer/images.yml}
ref=altlinux.space/alt-atomic/onyx/$IMAGE_TYPE:latest
nvidia_ref=altlinux.space/alt-atomic/onyx-nvidia/$IMAGE_TYPE:latest

cat > "$conf" <<EOF
images:
  - image: containers-storage:$ref
    target: $ref
    title:
      en: ALT Atomic Onyx (GNOME)
      ru: ALT Atomic Onyx (GNOME)

  - image: containers-storage:$nvidia_ref
    target: $nvidia_ref
    title:
      en: ALT Atomic Onyx (GNOME) with NVIDIA drivers
      ru: ALT Atomic Onyx (GNOME) с драйверами NVIDIA
EOF
