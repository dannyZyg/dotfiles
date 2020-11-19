# Enable colors and change prompt:
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

export EDITOR=nvim
export TMUX_CONFIG="$HOME/.config/tmux/.tmux.conf"

# gdit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Load zsh-syntax-highlighting; should be last.
source $HOME/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null


############### ############## ############## ##############

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

DOTFILES_DIR="$HOME/dotfiles"
HISTSIZE=99999
HISTFILESIZE=999999
SAVEHIST=$HISTSIZE
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history

export TEMP_DIR="/tmp"
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="af-magic"
plugins=(git zsh-syntax-highlighting)
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

source ~/dotfiles/aliases.sh
source ~/dotfiles/functions.sh
source ~/scripts/aws/aws.sh

if [[ "$OSTYPE" == "darwin"* ]]; then
	[ -f $(brew --prefix)/etc/profile.d/autojump.sh ] && . $(brew --prefix)/etc/profile.d/autojump.sh
fi

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

alias mysqlimportfile='python ~/scripts/mysql/mysqlimport.py'


# Added by serverless binary installer
export PATH="$HOME/.serverless/bin:$PATH"

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true

export ANKI_DIR="~/Library/Application\ Support/Anki2"
export ANKI_PROFILE="danny"

# to compile nhocr
# export CC=/usr/local/bin/gcc-10
# export FC=gfortran

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/danny/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/danny/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/danny/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/danny/google-cloud-sdk/completion.zsh.inc'; fi

# python penv
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
export PYENV_ROOT=$HOME/.pyenv
export PATH="$HOME/.pyenv/bin:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
	eval "$(pyenv init -)"
	eval "$(pyenv virtualenv-init -)"
fi

# virtualenvwrapper
export WORKON_HOME=~/.virtualenvs
if [ ! -d "$WORKON_HOME" ]; then mkdir -p $WORKON_HOME; fi
. ~/.pyenv/versions/3.9.0/bin/virtualenvwrapper.sh
