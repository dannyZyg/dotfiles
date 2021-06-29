echo "Hello from .zshrc"

# TODO: Keep an eye out for a different `--no-quarantine` solution.
# Currently, you can't do `brew bundle --no-quarantine` as an option.
# https://github.com/Homebrew/homebrew-bundle/issues/474
export HOMEBREW_CASK_OPTS="--no-quarantine --no-binaries"

# Handle Mac architectures and brew paths
if [[ "$OSTYPE" == "darwin"* ]]; then
	CPU=$(uname -p)
	if [[ "$CPU" == "arm" ]]; then
		export BREWPATH="/opt/homebrew/bin"
		export PATH="$BREWPATH:$PATH"
	else
		export BREWPATH="/usr/local/bin"
		export PATH="$BREWPATH:$PATH"
	fi
fi

export EDITOR=nvim
export TMUX_CONFIG="$HOME/.config/tmux/.tmux.conf"
export TEMP_DIR="/tmp"


# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh
# if [[ "$OSTYPE" == "darwin"* ]]; then
# 	[ -f $($BREWPATH --prefix)/etc/profile.d/autojump.sh ] \
# 		&& . $(brew --prefix)/etc/profile.d/autojump.sh
# fi

# Enable colors and change prompt:
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# gdit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

############### ############## ############## ##############

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

HISTSIZE=99999
HISTFILESIZE=999999
SAVEHIST=$HISTSIZE
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history

ZSH_THEME="af-magic"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
source ~/.config/zsh/plugins/ohmyzsh/themes/af-magic.zsh-theme 2>/dev/null
source $ZSH/oh-my-zsh.sh

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

# gdit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line



# export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true

# Added by serverless binary installer
export PATH="$HOME/.serverless/bin:$PATH"
export ANKI_DIR="~/Library/Application\ Support/Anki2"
export ANKI_PROFILE="danny"

# The next line updates PATH for the Google Cloud SDK.
[ -f "$HOME/google-cloud-sdk/path.zsh.inc" ] && \
	. "$HOME/google-cloud-sdk/path.zsh.inc"

# The next line enables shell command completion for gcloud.
[ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ] && \
	. "$HOME/google-cloud-sdk/completion.zsh.inc"

# # python penv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
	eval "$(pyenv init --path)"
	eval "$(pyenv virtualenv-init -)"
fi

export PATH="$HOME/.poetry/bin:$PATH"

# virtualenvwrapper
export WORKON_HOME=~/.virtualenvs
if [ ! -d "$WORKON_HOME" ]; then mkdir -p $WORKON_HOME; fi
. ~/.pyenv/versions/3.9.1/bin/virtualenvwrapper.sh

[ -f "$HOME/scripts/aws/aws.sh" ] && source "$HOME/scripts/aws/aws.sh"

DOTFILES_DIR="$HOME/.dotfiles"
[ -f "$DOTFILES_DIR/aliases.sh" ] && source "$DOTFILES_DIR/aliases.sh"
[ -f "$DOTFILES_DIR/functions.sh" ] && source "$DOTFILES_DIR/functions.sh"


source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme
