#!/usr/bin/env zsh

echo "\n<<< Starting macOS Setup >>>\n"

function install_homebrew() {
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

exists brew \
	&& echo "Homebrew already exists." \
	|| install_homebrew \

echo "\n<<< Installing brew packages >>>\n"
make brew-install
