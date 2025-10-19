#!/usr/bin/env bash
set -euo pipefail

sudo pacman -S --noconfirm --needed nodejs 

mkdir ~/.npm-global
npm config set prefix '~/.npm-global'

npm i -g n
n lts
