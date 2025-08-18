#!/bin/bash
set -euo pipefail

echo "::group:: ===$(basename "$0")==="

# Базовые утилиты и инструменты
BASIC_PACKAGES=(
  bash-completion
  fastfetch
  htop
  inxi
  iucode_tool
  notify-send
  openssh-server
  ptyxis
  starship
  systemd-ssh-agent  
  zsh
  zsh-autosuggestions
  zsh-completions
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
  dconf-editor
  gnome-control-center
  gnome-extension-manager
  gnome-keyring-ssh
  gnome-shell
  gnome-shell-extension-appindicator
  gnome-shell-extension-clipboard-indicator
  gnome-shell-extension-dash-to-dock
  gnome-shell-extension-session-keeper
  gnome-shell-extensions
)

# GNOME — приложения и утилиты
GNOME_DESKTOP_APPS=(
  foldy
  g4music
  gnome-browser-connector
  gnome-calculator
  gnome-calendar
  gnome-characters
  gnome-clocks
  gnome-disk-usage
  gnome-logs
  gnome-maps
  gnome-software
  gnome-text-editor
  gnome-tour
  gnome-user-docs
  gnome-weather
  key-rack
  loupe
  papers
  pika-backup
  resources
  showtime
  sushi
  tuner
  tuner-tweaks
  gnome-boxes
)

# GNOME — темы, шрифты и оформление
GNOME_THEMES=(
  icon-theme-adwaita
  fonts-ttf-cjkuni-ukai
  fonts-ttf-dejavu
  fonts-ttf-liberation
  gnome-backgrounds
  gnome-icon-theme
  gnome-icon-theme-symbolic
  gnome-themes-extra
  icon-theme-morewaita
  libgtk2-engine-adwaita
  pinentry-gnome3
  yelp
)

# Nautilus (файловый менеджер) и связанные пакеты
NAUTILUS_PACKAGES=(
  file-roller
  fuse-gvfs
  gvfs-backends
  nautilus
  nautilus-open-any-terminal
  nautilus-python
  nautilus-share
  samba-usershares
)

# Прочие приложения
MISC_APPS=(
  firefox
  power-profiles-daemon
)

# Xorg-драйверы для различных GPU и устройств
DRIVERS=(
  xorg-drv-amdgpu
  xorg-drv-intel
  xorg-drv-libinput
  xorg-drv-nouveau
  xorg-drv-qxl
  xorg-drv-spiceqxl
  xorg-drv-vmware
)

# Wayland/Qt/Vulkan утилиты
WAYLAND_QT=(
  qt5-wayland
  qt6-wayland
  vulkan-tools
  wayland-utils
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

FONTS=(
  fonts-ttf-jetbrains-mono-nl
  fonts-otf-abattis-cantarell
  fonts-ttf-fira-code-nerd
)

apt-get install -y \
  "${AUDIO_PACKAGES[@]}" \
  "${BASIC_PACKAGES[@]}" \
  "${DRIVERS[@]}" \
  "${FONTS[@]}" \
  "${GNOME_DESKTOP_APPS[@]}" \
  "${GNOME_SESSION_PACKAGES[@]}" \
  "${GNOME_SHELL_PACKAGES[@]}" \
  "${GNOME_THEMES[@]}" \
  "${MISC_APPS[@]}" \
  "${NAUTILUS_PACKAGES[@]}" \
  "${NETWORK_PRINT_PACKAGES[@]}" \
  "${WAYLAND_QT[@]}" \
  "${ZRAM_PACKAGES[@]}"

echo "::endgroup::"
