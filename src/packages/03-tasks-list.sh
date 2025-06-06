#!/bin/bash

echo "::group:: ===$(basename "$0")==="

TASKS=(
  386243
)

apt-repo test -y "${TASKS[@]}"

echo "::endgroup::"
