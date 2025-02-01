#!/bin/bash

# Создаем новый каталог для базы rpm
mkdir -p /usr/share/rpm
rsync -aA /var/lib/rpm/ /usr/share/rpm/
rm -rf /var/lib/rpm && ln -s ../../usr/share/rpm /var/lib/rpm

apt-get autoremove -y && apt-get clean && rm -rf /var/lib/apt/lists/* && mkdir /var/lib/apt/lists/partial