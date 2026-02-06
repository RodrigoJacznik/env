#!/bin/bash
set -euo pipefail

sudo ln -sf /usr/share/zoneinfo/America/Argentina/Buenos_Aires /etc/localtime
sudo hwclock --systohc
sudo timedatectl set-ntp true

sudo pacman -S --noconfirm --needed \
	base-devel \
	git \
	acpid \
	intel-ucode \
	linux-headers

if ! command -v yay &> /dev/null; then
    if [ -d "yay" ]; then
        rm -rf yay
    fi

	git clone https://aur.archlinux.org/yay.git
	cd yay
	makepkg -s --noconfirm
	sudo pacman -U --noconfirm --needed *.pkg.tar.zst
	cd ../
	rm -rf yay
fi