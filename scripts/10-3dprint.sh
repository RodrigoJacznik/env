#!/bin/bash
set -euo pipefail

# 1. Instalamos uv y prusa-slicer desde los repos oficiales
sudo pacman -S --noconfirm --needed uv prusa-slicer

# 2. Setup de build123d en tu carpeta de workspace
CAD_DIR="$HOME/workspace/3d_design"
mkdir -p "$CAD_DIR"
cd "$CAD_DIR"

# Usamos uv para crear el entorno e instalar build123d
# 'uv venv' crea el entorno virtual ultra rápido
uv venv
source .venv/bin/activate

# Instalamos build123d y ocp-vscode (para visualizar en VS Code)
uv pip install build123d ocp-vscode
