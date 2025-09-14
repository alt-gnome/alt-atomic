#!/bin/bash

echo "::group:: ===$(basename "$0")==="

TASKS=(
    394652
)

for task in "${TASKS[@]}"; do 
    apt-repo add "$task"
done

apt-get update

TASKS_PACKAGES=(
    icon-theme-alt-atomic-onyx
    plymouth-theme-atomic
)

if [ ${#TASKS_PACKAGES[@]} -gt 0 ]; then
    apt-get install -y "${TASKS_PACKAGES[@]}"
fi

for task in "${TASKS[@]}"; do 
    apt-repo rm "$task"
done

echo "::endgroup::"
