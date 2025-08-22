#!/bin/bash

set -e

echo "::group:: ===$(basename "$0")==="

curver=$(date +%Y%m%d)

if [ "$IMAGE_TYPE" = "nightly" ]; then
    postfix=" Nightly"
else
    postfix=""
fi

# Fix os-release file with current image info
sed -i "s|NAME=\".*\"|NAME=\"ALT Atomic Onyx$postfix\"|g" /usr/lib/os-release
sed -i "s|VERSION=\".*\"|VERSION=\"$curver-$IMAGE_TYPE\"|g" /usr/lib/os-release
sed -i "s|VERSION_ID=\".*\"|VERSION_ID=$curver)|g" /usr/lib/os-release
sed -i "s|BUILD_ID=\".*\"|BUILD_ID=\"Sisyphus $curver\"|g" /usr/lib/os-release
sed -i "s|CPE_NAME=\".*\"|CPE_NAME=\"cpe:/o:alt:atomic-onyx:$curver\"|g" /usr/lib/os-release

# Replace file with link
rm -rf /etc/os-release
ln -s /usr/lib/os-release /etc/os-release

echo "End branding.sh"
