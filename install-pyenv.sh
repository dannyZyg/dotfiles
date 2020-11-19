#!/bin/bash

curl https://pyenv.run | bash

export PYENV_ROOT=$HOME/.pyenv
export PATH="$HOME/.pyenv/bin:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
	eval "$(pyenv init -)"
	eval "$(pyenv virtualenv-init -)"
fi

pyenv install -f 2.7.18 \
	&& pyenv install -f 3.9.0 \
	&& pyenv global 3.9.0 \
	&& $(pyenv which python3) -m pip install virtualenvwrapper
