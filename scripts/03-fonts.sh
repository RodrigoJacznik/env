#!/bin/bash
set -euo pipefail

sudo pacman -S --noconfirm --needed \
	noto-fonts \
	noto-fonts-emoji \
	ttf-bitstream-vera \
	ttf-dejavu \
	ttf-droid \
	ttf-fira-mono \
	ttf-liberation \
	ttf-opensans \
	ttf-roboto \
	ttf-firacode-nerd \
	ttf-meslo-nerd \
	ttf-noto-nerd \
	ttf-nerd-fonts-symbols \
	ttf-jetbrains-mono-nerd

yay -S --noconfirm --needed oranchelo-icon-theme-git

fc-cache -fv