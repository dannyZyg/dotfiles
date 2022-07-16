#!/bin/bash

# Replace cat with bat
if command -v bat &> /dev/null ; then
  alias cat="bat --paging=never"
elif command -v batcat &> /dev/null ; then
  # APT package uses a binary called batcat
  alias cat="batcat --paging=never"
fi

alias c="clear"
alias today="date '+%y%m%d'"

# human-readable sizes
alias df='df -h'

# show sizes in MB
alias free='free -m'

alias np='nano -w PKGBUILD'
alias more=less

# confirm before overwriting something
alias cp="cp -i"

# Replace ls with exa
alias ls='exa -F'
alias la='exa -aF'
alias lt='exa -FT'
alias lta='exa -aFT'
alias ll='exa -alF --colour-scale'

# always use neovim
alias v='nvim'
alias vi='nvim'
alias vim='nvim'

alias r='ranger'
alias lf='lfub'

alias getPermissionsAsNum='stat -c "%a %n"'
alias myinternalip='internal-ip --ipv4'

alias setclip="xclip -selection c"
alias getclip="xclip -selection c -o"

#multi monitor
alias hdmimon='~/.screenlayout/hdmimon.sh'
alias usbCmon='~/.screenlayout/usbCmon.sh'
alias home-both='~/.screenlayout/home-both.sh'
alias dualmon='~/.screenlayout/dual-monitor.sh'
alias homemon='~/.screenlayout/home-hdmi.sh'
alias thinkpad-screen='~/.screenlayout/default-thinkpad.sh'
alias tvmon='~/.screenlayout/tvmon.sh'

#cleanup aliases
alias calcures='calcurse -C "$XDG_CONFIG_HOME"/calcurse -D "$XDG_DATA_HOME"/calcurse'
alias mocp='mocp -M "$XDG_CONFIG_HOME"/moc'

# find somewhere to put this
alias mysqlimportfile='python /home/danny/scripts/mysql/mysqlimport.py'

alias scandevices='sudo nmap -sn 192.168.1.1/24'

alias vrc="$EDITOR $HOME/.vimrc"
alias media='sudo mount 192.168.0.230:/volume1/Media /mnt/media'

alias awsc="$EDITOR ~/.aws/credentials"

# directory navigation
alias -- -='cd -'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

####
# git
##
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
# alias gcp="git cherry-pick"
# alias gbg="git bisect good"
# alias gbb="git bisect bad"

####
# pacman
####
alias pacmirrorupdate='sudo pacman-mirrors -f 0 && sudo pacman -Syy'
alias aup="yay -Syu --aur"
alias rmorphans='pacman -Qdt'

####
# trash
####
alias trp='trash-put'
alias tre='trash-empty'
alias trl='trash-list'
alias trr='trash-restore'
alias trm='trash-rm'

alias shellalias="$EDITOR ~/dotfiles/shell/aliases.sh"
alias shellfuncs="$EDITOR ~/dotfiles/shell/functions.sh"
alias sshc="$EDITOR ~/.ssh/config"
alias zrc="$EDITOR ~/dotfiles/config/zsh/.zshrc"

####
# tmux
####
alias tn="tmux -u -f $TMUX_CONFIG new"
alias ta="tmux -u -f $TMUX_CONFIG attach"
alias tat="tmux -u -f $TMUX_CONFIG attach -t"
alias tl="tmux -u -f $TMUX_CONFIG ls"
alias tt="$EDITOR $TMUX_CONFIG"

alias cdcd='cd ~/Library/Mobile\ Documents/\com\~apple\~CloudDocs/'
alias thisdir="basename $(pwd)"
alias oldbrew='arch -x86_64 /usr/local/bin/brew'

####
# espanso
####
alias ee='espanso edit'

# Update all zsh plugins
alias zsh-update-plugins="find "$ZDOTDIR/plugins" -type d -exec test -e '{}/.git' ';' -print0 | xargs -I {} -0 git -C {} pull -q"

# Grok stuff
alias grokaws="$CONDA_PATH/envs/grok-aws/bin/python ~/grok/grok-aws/grok-aws.py"
