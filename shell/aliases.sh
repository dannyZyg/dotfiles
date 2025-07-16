#!/bin/bash

# Replace cat with bat
if command -v bat &> /dev/null ; then
  alias cat="bat --paging=never"
elif command -v batcat &> /dev/null ; then
  # APT package uses a binary called batcat
  alias cat="batcat --paging=never"
fi

alias more=less

# confirm before overwriting something
alias cp="cp -i"

# Replace ls with exa
alias ls="eza -F"
alias la="eza -aF"
alias lt="eza -FT"
alias lta="eza -aFT"
alias ll="eza -alF --colour-scale"

# always use neovim
alias v="nvim"
alias vi="nvim"
alias vim="nvim"

####
# tmux
####
alias tn="tmux -u -f $TMUX_CONFIG new"
alias ta="tmux -u -f $TMUX_CONFIG attach"
alias tat="tmux -u -f $TMUX_CONFIG attach -t"
alias tl="tmux -u -f $TMUX_CONFIG ls"
alias tt="$EDITOR $TMUX_CONFIG"

