#!/bin/bash

echo "::group:: ===$(basename "$0")==="

TASKS=(

)

for task in "${TASKS[@]}"; do
  apt-repo test "$task"
done

echo "::endgroup::"
