#!/bin/bash
set -euo pipefail

sudo pacman -S --noconfirm --needed \
	nvidia \
	nvidia-utils \
	nvidia-settings \
	vulkan-icd-loader 
