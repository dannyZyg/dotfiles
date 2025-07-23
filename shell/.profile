#!/bin/zsh

# Loaded in interactive and non-interactive shells

export PATH=~/.local/bin:$PATH
export PATH=/home/danny/.local/bin/aws_completer:$PATH
export PATH=~/.config/npm-global/bin:$PATH
export FILE="ranger"
export TERMINAL="alacritty"
export EDITOR="nvim"
export BROWSER="re.sonny.Junction.desktop"
export READER="zathura"
export PAGER="less"
export WM="i3"
export QT_QPA_PLATFORMTHEME="qt5ct"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

export XDG_DATA_HOME="$HOME"/.local/share
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_CACHE_HOME="$HOME"/.cache

export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"

export PATH="$PATH:$GEM_HOME/bin"

export VAGRANT_HOME="$XDG_DATA_HOME"/vagrant
export VAGRANT_ALIAS_FILE="$XDG_DATA_HOME"/vagrant/aliases
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export PATH=$CARGO_HOME/bin:$PATH
export MPLAYER_HOME="$XDG_CONFIG_HOME"/mplayer
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export AWS_PROFILE="dk"
export AWS_DEFAULT_REGION="ap-southeast-2"
export CONDA_PATH="$HOME/.config/miniconda"

if [[ "$OSTYPE" == "darwin"* ]]; then
  export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock
elif [[ "$OSTYPE" == "linux"* ]]; then
  export SSH_AUTH_SOCK=~/.1password/agent.sock
fi

export PRIMARY_BROWSER="chrome"
