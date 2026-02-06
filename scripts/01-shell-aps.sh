#!/bin/bash
set -euo pipefail

sudo pacman -S --noconfirm --needed \
	less \
    nvim lua-language-server \
    tree \
    stow \
    xclip \
    iw impala \
    btop \
	openbsd-netcat \
    zsh starship \
    dosfstools udisks2 udiskie \
    gvfs gvfs-mtp gvfs-gphoto2 \
	docker \
    ripgrep \
	ufw

sudo systemctl start --now docker.service