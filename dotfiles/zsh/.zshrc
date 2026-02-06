[ -f "$HOME/.envs" ] && source "$HOME/.envs"

# The following lines were added by compinstall
zstyle :compinstall filename '/home/rodrigo/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
eval "$(starship init zsh)"

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

alias ls="ls --color"


alias prusa='GDK_BACKEND=x11 prusa-slicer'

cad() {
    cd "$HOME/workspace/3d_design"
    if [ -d ".venv" ]; then
        source .venv/bin/activate
        echo "🛠️ Entorno build123d activo"
    fi
}

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh