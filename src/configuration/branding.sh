#!/bin/bash
set -e

echo "Running branding.sh"

echo "Atomic" > /etc/hostname
cat << EOF > /etc/os-release
NAME="ALT Atomic"
VERSION="0.1"
VERSION_ID="0.1"
PRETTY_NAME="ALT Atomic"
ID=altlinux
ID_LIKE="altlinux"
PLATFORM_ID="platform:altlinux"
PRETTY_NAME="ALT Atomic"
VARIANT="Atomic"
VARIANT_ID="atomic"
ANSI_COLOR="1;33"
CPE_NAME="cpe:/o:alt:sisyphus:20240122"
BUILD_ID="Sisyphus 20240122"
ALT_BRANCH_ID="sisyphus"
HOME_URL="https://atomic.alt-gnome.ru/"
BUG_REPORT_URL="https://atomic.alt-gnome.ru/"
LOGO=altlinux
EOF

cat << EOF > /usr/lib/os-release
NAME="ALT Atomic"
VERSION="0.1"
VERSION_ID="0.1"
PRETTY_NAME="ALT Atomic"
ID=altlinux
ID_LIKE="altlinux"
PLATFORM_ID="platform:altlinux"
PRETTY_NAME="ALT Atomic"
VARIANT="Atomic"
VARIANT_ID="atomic"
ANSI_COLOR="1;33"
CPE_NAME="cpe:/o:alt:sisyphus:20240122"
BUILD_ID="Sisyphus 20240122"
ALT_BRANCH_ID="sisyphus"
HOME_URL="https://atomic.alt-gnome.ru/"
BUG_REPORT_URL="https://atomic.alt-gnome.ru/"
LOGO=altlinux
EOF

echo "End branding.sh"