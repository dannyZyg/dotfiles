#!/bin/sh
# Shell-agnostic environment variables
# Sourced by zprofile (and potentially bashrc)

# XDG Base Directories
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

# System detection
export HOST_OS="$(uname -s)"
export HOST_ARCH="$(uname -m)"

# Default applications
export EDITOR="nvim"
export PAGER="less"
export COLORTERM=truecolor

# Platform-specific config
if [ "$(uname)" = "Darwin" ]; then
  export BREWPATH="/opt/homebrew/bin"
  export PATH="$BREWPATH:$PATH"
  export PATH="/opt/homebrew/sbin:$PATH"
  export PATH="$($BREWPATH/brew --prefix)/opt/llvm/bin:$PATH"
  export PATH="$PATH:/Applications/calibre.app/Contents/MacOS"
  export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock

elif [ "$(uname)" = "Linux" ]; then
  export FILE="ranger"
  export TERMINAL="alacritty"
  export BROWSER="re.sonny.Junction.desktop"
  export READER="zathura"
  export WM="i3"
  export QT_QPA_PLATFORMTHEME="qt5ct"
  export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
  export SSH_AUTH_SOCK=~/.1password/agent.sock
fi

# PATH additions
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.config/npm-global/bin:$PATH"

# Tool configs
export TMUX_CONFIG="$HOME/.config/tmux/tmux.conf"

# Node (n)
export N_PREFIX="$HOME/.config/n"
export PATH="$N_PREFIX/bin:$PATH"

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# Cargo/Rust
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export PATH="$CARGO_HOME/bin:$PATH"

# AWS
export AWS_PROFILE="dk"
export AWS_DEFAULT_REGION="ap-southeast-2"

# Opencode
export PATH="$HOME/.opencode/bin:$PATH"

# Machine specific env
[ -f "$HOME/.config/.env.sh" ] && . "$HOME/.config/.env.sh"
