#!/bin/bash
set -euo pipefail

echo "::group:: ===$(basename "$0")==="

/usr/libexec/update-initramfs

echo "::endgroup::"
