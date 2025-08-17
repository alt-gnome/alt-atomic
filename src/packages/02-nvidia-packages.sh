#!/bin/bash

set -e

echo "::group:: ===$(basename "$0")==="

if [ "$BUILD_TYPE" = "nvidia" ]; then
  kflavor=$(uname -r | sed -E 's/^[^-]*-([^-]*).*/\1/')
  apt-get install -y kernel-modules-nvidia-$kflavor libcuda libnvidia-encode nvidia-modprobe nvidia-powerd nvidia-smi libnvidia-opticalflow libnvidia-vksc-core libnvoptix libnvcuvid ocl-nvidia nvidia-vaapi-driver blacklist-nouveau nvidia-settings libnvidia-container1 libnvidia-container-tools nvidia-settings switcheroo-control
  CONF="/etc/modprobe.d/nvidia_common.conf"
  [ -f "$CONF" ] || exit 0
  sed -i -E 's|^#?(options nvidia NVreg_PreserveVideoMemoryAllocations=).*|\11|' "$CONF"
fi

echo "::endgroup::"