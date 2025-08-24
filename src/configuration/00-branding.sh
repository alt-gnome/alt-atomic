#!/bin/bash

set -e

echo "::group:: ===$(basename "$0")==="

curver=$(date +%Y%m%d)
pretty_curver=$(date +%d.%m.%Y)

if [ "$IMAGE_TYPE" = "nightly" ]; then
    pretty_type="Nightly"
    postfix=" $pretty_type"
    release_type="development"
else
    postfix=""
    pretty_type="Stable"
    release_type="stable"
fi

# Fix os-release file with current image info
sed -i "s|PRETTY_NAME=.*|PRETTY_NAME=\"ALT Atomic Onyx$postfix\"|g" /usr/lib/os-release
sed -i "s|VERSION=.*|VERSION=\"$pretty_curver $pretty_type\"|g" /usr/lib/os-release
sed -i "s|VERSION_ID=.*|VERSION_ID=$curver|g" /usr/lib/os-release
sed -i "s|CPE_NAME=.*|CPE_NAME=\"cpe:/o:alt:atomic:$IMAGE_TYPE:$curver\"|g" /usr/lib/os-release
sed -i "s|RELEASE_TYPE=.*|RELEASE_TYPE=$release_type|g" /usr/lib/os-release

# Replace file with link
rm -rf /etc/os-release
ln -s /usr/lib/os-release /etc/os-release

echo "End branding.sh"
