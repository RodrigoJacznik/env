#!/usr/bin/env bash
set -euo pipefail

sudo pacman -S --noconfirm --needed nodejs 

export NPM_GLOBAL_DIR="$HOME/.npm-global"

mkdir -p "$NPM_GLOBAL_DIR"
npm config set prefix "$NPM_GLOBAL_DIR"

export PATH="$NPM_GLOBAL_DIR/bin:$PATH"

npm i -g n
n lts
