#!/bin/bash
set -euo pipefail

DRY_RUN=false

if [[ "${1:-}" == "--dry-run" ]]; then
    echo "dry"
    DRY_RUN=true
fi

for file in ./scripts/*.sh; do
    echo "▶ Running $file"
    if [[ "$DRY_RUN" == "false" ]]; then
        $file
    fi
done

cd dotfiles
for package in *; do
	if [[ "$DRY_RUN" == "false" ]]; then
		stow -R -t ~ "$package"
	else 
		stow -nv -t ~ "$package"
	fi
done

cd ../
