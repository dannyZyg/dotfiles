#!/bin/zsh

. "/Users/dannykeig/.local/share/cargo/env"

# Loaded in interactive and non-interactive shells

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH=~/.local/bin:$PATH
export PATH=/home/danny/.local/bin/aws_completer:$PATH
export FILE='ranger'
export TERMINAL='alacritty'
export EDITOR='nvim'
export BROWSER='firefox'
export READER='zathura'
export PAGER='less'
export WM='i3'
export QT_QPA_PLATFORMTHEME="qt5ct"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

export XDG_DATA_HOME="$HOME"/.local/share
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_CACHE_HOME="$HOME"/.cache

# # Cleanup
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export GEM_HOME="$XDG_DATA_HOME"/gem
export GEM_SPEC_CACHE="$XDG_CACHE_HOME"/gem
export VAGRANT_HOME="$XDG_DATA_HOME"/vagrant
export VAGRANT_ALIAS_FILE="$XDG_DATA_HOME"/vagrant/aliases
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export MPLAYER_HOME="$XDG_CONFIG_HOME"/mplayer
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export AWS_PROFILE=dk

# eval `keychain --eval --agents ssh id_rsa` >> /dev/null 2>&1
#

if [[ "$(tty)" = "/dev/tty1" ]]; then
	pgrep i3 || startx
fi
