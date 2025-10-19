#!/bin/bash
set -euo pipefail

sudo pacman -S --noconfirm --needed \
	bluez \
	bluez-utils \
	bluetui

sudo systemctl enable --now bluetooth

