[ -f "$HOME/.paths" ] && source "$HOME/.paths"

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
