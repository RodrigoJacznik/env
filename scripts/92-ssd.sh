#!/bin/bash
set -euo pipefail

sudo systemctl enable --now fstrim.timer
