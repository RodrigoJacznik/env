#!/bin/bash
set -euo pipefail

sudo pacman -S --noconfirm --needed \
	i3-wm \
	xorg-server \
	xorg-xinit \
	picom \
	rofi \
	polybar \
	dunst \
	ly

sudo systemctl enable ly.service
