#!/bin/bash
set -euo pipefail

sudo pacman -S --noconfirm --needed uv prusa-slicer

CAD_DIR="$HOME/workspace/3d_design"
mkdir -p "$CAD_DIR"
cd "$CAD_DIR"

uv venv --python 3.12
source .venv/bin/activate

uv pip install build123d ocp-vscode
