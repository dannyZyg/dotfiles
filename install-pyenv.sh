#!/bin/bash

curl https://pyenv.run | bash
exec "$SHELL"

pyenv install 2.7.18 \
	& pyenv global 3.9.0 \
	& $(pyenv which python3) -m pip install virtualenvwrapper
