#!/bin/bash

echo "::group:: ===$(basename "$0")==="

apt-get update

TASKS=(

)

for task in "${TASKS[@]}"; do 
    apt-repo add task "$task"
done

TASKS_PACKAGES=(

)

if [ ${#TASKS_PACKAGES[@]} -gt 0 ]; then
    apt-get install -y "${TASKS_PACKAGES[@]}"
fi

echo "::endgroup::"
