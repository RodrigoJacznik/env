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

if [ "$IS_VM" = true ]; then
    sudo pacman -S --noconfirm --needed virtualbox-guest-utils mesa
    sudo systemctl enable --now vboxservice.service
else
    GPU_VENDOR=$(lspci | grep -iE 'vga|3d|display')

    if echo "$GPU_VENDOR" | grep -iq "nvidia"; then
        sudo pacman -S --noconfirm --needed nvidia-open nvidia-utils nvidia-settings vulkan-icd-loader 
        
        # Configuración de DRM Modesetting para i3
        echo "options nvidia-drm modeset=1" | sudo tee /etc/modprobe.d/nvidia.conf
        sudo sed -i 's/^MODULES=(/MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm /' /etc/mkinitcpio.conf
        sudo mkinitcpio -P

    elif echo "$GPU_VENDOR" | grep -iq "intel"; then
        sudo pacman -S --noconfirm --needed vulkan-intel mesa

    elif echo "$GPU_VENDOR" | grep -iqE "amd|ati"; then
        sudo pacman -S --noconfirm --needed vulkan-radeon mesa
    
    else
        sudo pacman -S --noconfirm --needed mesa
    fi
fi