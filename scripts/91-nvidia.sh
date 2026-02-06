#!/bin/bash
set -euo pipefail

if systemd-detect-virt -q; then
    echo "☁️ Entorno VIRTUAL detectado (VirtualBox/VMware)."
    echo "Instalando Guest Additions..."
    sudo pacman -S --noconfirm --needed virtualbox-guest-utils
    sudo systemctl enable --now vboxservice.service
else
	sudo pacman -S --noconfirm --needed \
		nvidia-open \
		nvidia-utils \
		nvidia-settings \
		vulkan-icd-loader 

	# --- CONFIGURACIÓN DE MODESETTING ---
	# Esto es vital para evitar el "tearing" y asegurar que i3 arranque bien
	CONF_FILE="/etc/modprobe.d/nvidia.conf"
	if [ ! -f "$CONF_FILE" ]; then
		echo "options nvidia-drm modeset=1" | sudo tee "$CONF_FILE"
	fi

	# --- ACTUALIZAR EL KERNEL IMAGE ---
	# Necesitamos que el sistema sepa que tiene que cargar nvidia al inicio
	sudo sed -i 's/^MODULES=(/MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm /' /etc/mkinitcpio.conf
	sudo mkinitcpio -P
fi