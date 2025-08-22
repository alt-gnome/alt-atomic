#!/bin/bash

echo "::group:: ===$(basename "$0")==="

TASKS=(
    392850
)

for task in "${TASKS[@]}"; do 
    apt-repo add "$task"
done

apt-get update

TASKS_PACKAGES=(
    branding-alt-atomic-onyx-*
    alt-atomic-logos
)

if [ ${#TASKS_PACKAGES[@]} -gt 0 ]; then
    apt-get install -y "${TASKS_PACKAGES[@]}"
fi

for task in "${TASKS[@]}"; do 
    apt-repo rm "$task"
done

echo "::endgroup::"
