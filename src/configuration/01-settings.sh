#!/bin/bash

set -e

echo "::group:: ===$(basename "$0")==="

# Неожиданно Alt linux в /var/lib/openvpn/dev записывает устройство urandom
# устройства запрещено включать в коммит, только файлы и сим-линки
rm -f /var/lib/openvpn/dev/urandom
ln -s /dev/urandom /var/lib/openvpn/dev/urandom

# Спрячем приложения
sed -i 's@\[Desktop Entry\]@\[Desktop Entry\]\nHidden=true@g' /usr/share/applications/nvtop.desktop
sed -i 's@\[Desktop Entry\]@\[Desktop Entry\]\nHidden=true@g' /usr/share/applications/org.gnome.Console.desktop

# Включаем сервисы
systemctl --global enable pipewire{,-pulse}{,.socket} wireplumber
systemctl enable bluetooth
systemctl enable gdm
systemctl enable avahi-daemon
systemctl enable wsdd

# Отключаем сервис
systemctl mask packagekit.service

# Отключаем плагин packagekit для gnome-software
for dir in /usr/lib64/gnome-software/plugins-*; do
    if [ -d "$dir" ]; then
        file="$dir/libgs_plugin_packagekit.so"
        if [ -e "$file" ]; then
            mv "$file" "${file}.disabled"
            echo "Файл $file переименован в ${file}.disabled"
        fi
    fi
done

# Включаем создание домашних папок
sed -i 's/^[[:space:]]*enabled=false/enabled=True/i' /etc/xdg/user-dirs.conf

# Синхронизируем файлы
rsync -av --progress /src/source/configuration/etc/ /etc/
rsync -av --progress /src/source/configuration/usr/ /usr/

# Обновление dconf
dconf update

# Обновление шрифтов
fc-cache -fv

echo "::endgroup::"
