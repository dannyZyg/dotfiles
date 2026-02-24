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

# tmux
alias tn="tmux -u -f $TMUX_CONFIG new"
alias ta="tmux -u -f $TMUX_CONFIG attach"
alias tat="tmux -u -f $TMUX_CONFIG attach -t"
alias tl="tmux -u -f $TMUX_CONFIG ls"
alias tt="$EDITOR $TMUX_CONFIG"

# directory navigation
alias -- -='cd -'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# git
alias ga="git add"
alias gap="git add -p"
alias gc="git commit"
alias gca="git commit --amend"
alias gb="git branch"
alias gs='git status'
alias gd="git diff"
alias gp='git push'
alias gl="git pull"
alias gco='git checkout'
alias gfo='git fetch origin'
alias gitStashClear="git stash; git stash clear; git clean -f; git clean -fd"
alias gcb="g rev-parse --abbrev-ref HEAD"
alias gt="git tag"
alias gm="git merge"
alias gg="git log --graph --pretty=format:'%C(bold red)%h%Creset -%C(bold yellow)%d%Creset %s %C(bold green)(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias cgb="git rev-parse --abbrev-ref HEAD"

alias tms="$HOME/dev/tmux-delight/tmux-session --layouts-dir $HOME/dev/tmux-layouts/"
