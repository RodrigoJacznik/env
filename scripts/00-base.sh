#!/bin/bash
set -euo pipefail

sudo pacman -S --noconfirm --needed \
	base-devel \
	git \
	acpid \
	intel-ucode \
	linux-headers

git clone https://aur.archlinux.org/yay.git
cd yay
sudo makepkg -si
cd ../
rm -r yay
