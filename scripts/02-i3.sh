#!/bin/bash
set -euo pipefail

sudo pacman -S --noconfirm --needed \
	i3-wm xorg xorg-init \
	picom \
	rofi \
	polybar \
	dunst \
	ly

