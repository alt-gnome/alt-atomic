#!/bin/bash

echo "::group:: ===$(basename "$0")==="

apt-get update
apt-get -y dist-upgrade
apt-get -y install apt-repo

echo "::endgroup::"
