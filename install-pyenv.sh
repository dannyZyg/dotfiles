#!/bin/bash

PY2='2.7.18'
PY3='3.9.0'

function get_ver(){
	VER=''
	if [ $1 == 2 ]; then
		VER=$PY2
	elif [ $1 == 3 ]; then
		VER=$PY3
	fi
	echo $VER
}

function install_python_version(){
	VER=$(get_ver $1)
	pyenv install -f $VER \
		&& pyenv global $VER \
		&& $(pyenv which python$1) -m pip install virtualenvwrapper
}

function setup_nvim_env(){
	VER=$(get_ver $1)
	export WORKON_HOME=~/.virtualenvs
	if [ ! -d "$WORKON_HOME" ]; then mkdir -p $WORKON_HOME; fi
	. ~/.pyenv/versions/$VER/bin/virtualenvwrapper.sh
	mkvirtualenv neovim-python$1 \
		&& pip install pynvim 
}

curl https://pyenv.run | bash

export PYENV_ROOT=$HOME/.pyenv
export PATH="$HOME/.pyenv/bin:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
	eval "$(pyenv init -)"
	eval "$(pyenv virtualenv-init -)"
fi

install_python_version 2 \
	&& setup_nvim_env 2

install_python_version 3 \
	&& setup_nvim_env 3
