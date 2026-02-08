#!/bin/bash
set -euo pipefail

IS_VM=false

while [[ $# -gt 0 ]]; do
  case $1 in
    -v|--vm)
      IS_VM=true
      shift
      ;;
    *)
      shift
      ;;
  esac
done

# --- LÓGICA DE INSTALACIÓN ---

if [ "$IS_VM" = true ]; then
    echo "Configurando entorno para VirtualBox..."
    sudo pacman -S --noconfirm --needed virtualbox-guest-utils mesa
    sudo systemctl enable --now vboxservice.service
else
    echo "Configurando drivers Nvidia para hardware real..."
    sudo pacman -S --noconfirm --needed \
        nvidia-open \
        nvidia-utils \
        nvidia-settings \
        vulkan-icd-loader 

    echo "options nvidia-drm modeset=1" | sudo tee /etc/modprobe.d/nvidia.conf

    if ! grep -q "nvidia" /etc/mkinitcpio.conf; then
        sudo sed -i 's/^MODULES=(/MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm /' /etc/mkinitcpio.conf
        sudo mkinitcpio -P
    fi
fi