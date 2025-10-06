#!/bin/bash
set -euo pipefail

echo "::group:: ===$(basename "$0")==="

/usr/libexec/update-bootc-kernel.sh

echo "::endgroup::"
