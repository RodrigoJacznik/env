#!/bin/bash
set -euo pipefail

sudo pacman -S --noconfirm --needed \
	less \
    nvim lua-language-server \
    tree \
    stow \
    xclip \
    iw iwd impala \
    btop \
	openbsd-netcat \
    zsh starship zsh-autosuggestions zsh-syntax-highlighting \
    dosfstools udisks2 udiskie \
    gvfs gvfs-mtp gvfs-gphoto2 \
	docker \
    ripgrep \
	ufw \
    xdg-user-dirs

LC_ALL=C xdg-user-dirs-update --force
mkdir -p "$HOME/workspace"

sudo systemctl start --now docker.service
sudo systemctl enable --now iwd