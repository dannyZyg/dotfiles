#!/bin/bash

alias c="clear"
alias today="date '+%y%m%d'"
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias np='nano -w PKGBUILD'
alias more=less

alias cp="cp -i"                          # confirm before overwriting something
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias r='ranger'

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
alias swapdb='python /home/danny/s1t2/dbs/swap_db.py'



alias scandevices='sudo nmap -sn 192.168.1.1/24'

alias calibreUpdate='sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin'

alias vrc="$EDITOR $HOME/.vimrc"
alias media='sudo mount 192.168.0.230:/volume1/Media /mnt/media'

alias awsc="$EDITOR ~/.aws/credentials"

alias vpnjp="expressvpn connect 'Japan'"
alias vpnoff="expressvpn disconnect"

# directory navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

####
# git
##
alias gc="git commit"
alias gb="git branch"
alias gs='git status'
alias gd="git diff"
alias gp='git push'
alias gl="git pull"
alias gco='git checkout'
alias gitStashClear="git stash; git stash clear; git clean -f; git clean -fd"
alias gcb="g rev-parse --abbrev-ref HEAD"
alias gt="git tag"
alias gm="git merge"
alias gg="git log --graph --pretty=format:'%C(bold red)%h%Creset -%C(bold yellow)%d%Creset %s %C(bold green)(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
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

alias shellalias='vim ~/dotfiles/shell/aliases.sh'
alias shellfuncs='vim ~/dotfiles/shell/functions.sh'
