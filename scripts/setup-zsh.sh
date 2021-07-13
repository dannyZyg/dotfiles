#!/usr/bin/env zsh

echo "\n<<< Starting ZSH Setup >>>\n"

# Installation unnecessary; it's in the Brewfile.
BREWPATH=''

if [[ "$OSTYPE" == "darwin"* ]]; then
	CPU=$(uname -p)
	if [[ "$CPU" == "arm" ]]; then
		BREWPATH="/opt/homebrew/bin"
	else
		BREWPATH="/usr/local/bin"
	fi
fi

ZSHPATH="$BREWPATH/zsh"

# https://stackoverflow.com/a/4749368/1341838
if grep -Fxq $ZSHPATH '/etc/shells'; then
  echo "$ZSHPATH already exists in /etc/shells"
else
  echo "Enter superuser (sudo) password to edit /etc/shells"
  echo $ZSHPATH | sudo tee -a '/etc/shells' >/dev/null
fi


if [ "$SHELL" = "$ZSHPATH" ]; then
  echo "\$SHELL is already $ZSHPATH"
else
  echo "Enter user password to change login shell"
  chsh -s $ZSHPATH
fi
