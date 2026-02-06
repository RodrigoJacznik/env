#!/usr/bin/env bash
set -euo pipefail

sudo pacman -S --noconfirm --needed nodejs 

mkdir -p "$NPM_GLOBAL_DIR"
mkdir -p "$N_PREFIX"

npm config set prefix "$NPM_GLOBAL_DIR"


npm i -g n
n lts
