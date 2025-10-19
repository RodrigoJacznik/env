#!/bin/bash
set -euo pipefail

sudo pacman -S --noconfirm --needed \
    sof-firmware \
    alsa-utils \
    pipewire \
    pipewire-alsa \
    pipewire-audio \
    pipewire-jack \
    pipewire-pulse \
	pavucontrol \
    wireplumber 

sudo systemctl enable pipewire-pulse.service
sudo systemctl start pipewire-pulse.service
