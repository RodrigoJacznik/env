#!/bin/bash
set -euo pipefail

CURRENT_USER=$(logname)

if [ "$(getent passwd "$CURRENT_USER" | cut -d: -f7)" != "/bin/zsh" ]; then
    sudo chsh -s /bin/zsh "$CURRENT_USER"
fi

sudo usermod -aG docker,audio,video,storage "$CURRENT_USER"

sudo systemctl enable ufw.service
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
echo "y" | sudo ufw enable
sudo systemctl start ufw

git config --global core.autocrlf input
git config --global user.name "Rodrigo Jacznik"
git config --global user.email "jacznik.rodrigo@gmail.com"
git config --global init.defaultBranch main
