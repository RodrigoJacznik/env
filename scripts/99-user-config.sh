#!/bin/bash
set -euo pipefail

CURRENT_USER=$(logname)

if [ "$(getent passwd "$CURRENT_USER" | cut -d: -f7)" != "/bin/zsh" ]; then
    sudo chsh -s /bin/zsh "$CURRENT_USER"
fi

sudo usermod -aG docker,audio,video "$CURRENT_USER"

sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw enable
