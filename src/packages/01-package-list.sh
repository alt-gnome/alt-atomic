#!/bin/bash
set -euo pipefail

echo "::group:: ===$(basename "$0")==="

# Базовые утилиты и инструменты
BASIC_PACKAGES=(
  htop
  fastfetch
  nvtop
  notify-send
  zsh
  zsh-completions
  starship
  bash-completion
  inxi
  openssh-server
  iucode_tool
  systemd-ssh-agent
  ptyxis
)

# Генератор ZRAM
ZRAM_PACKAGES=(
  zram-generator
)

# GNOME — базовые сеансы (Wayland/X11)
GNOME_SESSION_PACKAGES=(
  gnome-session-wayland
  gnome-session-xsession
)

# GNOME — основные компоненты Shell и связанные пакеты
GNOME_SHELL_PACKAGES=(
  gnome-control-center
  gnome-shell
  gnome-shell-extensions
  gnome-tweaks
  dconf-editor
  gnome-keyring-ssh
  gnome-extension-manager
  gnome-shell-extension-appindicator
  gnome-shell-extension-dash-to-dock
)

# GNOME — приложения и утилиты
GNOME_DESKTOP_APPS=(
  gnome-user-docs
  gnome-tour
  gnome-logs
  gnome-calculator
  gnome-calendar
  gnome-characters
  gnome-text-editor
  showtime
  loupe
  gnome-weather
  gnome-clocks
  gnome-maps
  gnome-browser-connector
  gnome-software
  gnome-console
  gnome-disk-usage
  resources
  sushi
  pika-backup
  papers
)

# GNOME — темы, шрифты и оформление
GNOME_THEMES=(
  gtk3-theme-adw-gtk3
  icon-theme-morewaita
  gnome-backgrounds
  pinentry-gnome3
  yelp
  gnome-icon-theme
  gnome-icon-theme-symbolic
  gnome-themes-extra
  libgtk2-engine-adwaita
  fonts-otf-abattis-cantarell
  fonts-ttf-cjkuni-ukai
  fonts-ttf-liberation
  fonts-ttf-dejavu
)

# Nautilus (файловый менеджер) и связанные пакеты
NAUTILUS_PACKAGES=(
  nautilus-python
  gvfs-backends
  fuse-gvfs
  nautilus
  nautilus-share
  samba-usershares
  file-roller
)

# Прочие приложения
MISC_APPS=(
  firefox
  power-profiles-daemon
)

# Xorg-драйверы для различных GPU и устройств
DRIVERS=(
  xorg-drv-libinput
  xorg-drv-qxl
  xorg-drv-spiceqxl
  xorg-drv-intel
  xorg-drv-amdgpu
  xorg-drv-vmware
  xorg-drv-nouveau
)

# Wayland/Qt/Vulkan утилиты
WAYLAND_QT=(
  qt5-wayland
  qt6-wayland
  wayland-utils
  vulkan-tools
)

# Аудиоподсистема (PipeWire)
AUDIO_PACKAGES=(
  pipewire
  wireplumber
)

# Сеть и печать (Avahi, CUPS, fwupd, etc.)
NETWORK_PRINT_PACKAGES=(
  avahi-daemon
  cups-browsed
  fwupd
  libnss-mdns
  wsdd
)

apt-get install -y \
  "${BASIC_PACKAGES[@]}" \
  "${ZRAM_PACKAGES[@]}" \
  "${GNOME_SESSION_PACKAGES[@]}" \
  "${GNOME_SHELL_PACKAGES[@]}" \
  "${GNOME_DESKTOP_APPS[@]}" \
  "${GNOME_THEMES[@]}" \
  "${NAUTILUS_PACKAGES[@]}" \
  "${MISC_APPS[@]}" \
  "${DRIVERS[@]}" \
  "${WAYLAND_QT[@]}" \
  "${AUDIO_PACKAGES[@]}" \
  "${NETWORK_PRINT_PACKAGES[@]}"

echo "::endgroup::"
