#!/bin/bash
set -euo pipefail

sudo pacman -S --noconfirm --needed \
	xf86-video-intel \
    brightnessctl \
    tlp 

sudo systemctl enable --now tlp
