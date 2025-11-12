if [ -n "$DISTROBOX_ENTER_PATH" ]; then
    echo "Switching to bash inside Distrobox..."
    exec /bin/bash
    exit 0
fi

# zsh-autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
