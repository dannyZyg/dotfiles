#! /bin/bash

function exists() {
	command -v $1 >/dev/null 2>&1
}

function install_homebrew() {
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

exists brew \
	|| install_homebrew \

make brew-install
