#!/bin/bash

echo "::group:: ===$(basename "$0")==="

TASKS=(

)

for task in "${TASKS[@]}"; do 
    apt-repo add task "$task"
done

apt-get update

TASKS_PACKAGES=(

)

if [ ${#TASKS_PACKAGES[@]} -gt 0 ]; then
    apt-get install -y "${TASKS_PACKAGES[@]}"
fi

echo "::endgroup::"
