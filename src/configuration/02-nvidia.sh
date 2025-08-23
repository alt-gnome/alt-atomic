#!/bin/bash

echo "::group:: ===$(basename "$0")==="

if [ "$BUILD_TYPE" = "nvidia" ]; then
  touch /usr/lib/bootc/kargs.d/10-nvidia.toml
  echo "kargs = [\"nvidia_drm.modeset=1\"]" > /usr/lib/bootc/kargs.d/10-nvidia.toml
  systemctl enable nvidia-suspend
  systemctl enable nvidia-hibernate
  systemctl enable suspend-then-hibernate
  systemctl enable nvidia-resume
  systemctl enable nvidia-powerd
  systemctl enable switcheroo-control
fi

echo "End kernel_setup.sh"