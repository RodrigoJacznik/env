#!/bin/bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DRY_RUN=false

if [ -f "$REPO_ROOT/dotfiles/zsh/.env" ]; then
    source "$REPO_ROOT/dotfiles/zsh/.env"
fi

if [[ $EUID -eq 0 ]]; then
   echo "No ejecutes este script como root."
   exit 1
fi

if [[ "${1:-}" == "--dry-run" ]]; then
    echo "dry"
    DRY_RUN=true
fi

for file in $(ls "$REPO_ROOT"/scripts/*.sh | sort); do
    echo "▶ Running $file"
    if [[ "$DRY_RUN" == "false" ]]; then
        chmod +x "$file"
        "$file"
    fi
done

cd "$REPO_ROOT/dotfiles"
for package in *; do
    # Evitar intentar stoweamos archivos sueltos si los hay
    if [ -d "$package" ]; then
        if [[ "$DRY_RUN" == "false" ]]; then
            stow -R -t ~ "$package"
            echo "✅ Stowed $package"
        else 
            stow -nv -t ~ "$package"
        fi
    fi
done
cd "$REPO_ROOT"