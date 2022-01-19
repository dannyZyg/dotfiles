#!/bin/bash

brew_dump=$(brew bundle dump --file=-)

taps=$(echo "$brew_dump" | grep 'tap ')
brew_packages=$(echo "$brew_dump" | grep 'brew ')
cask_packages=$(echo "$brew_dump" | grep 'cask ')
mas_packages=$(echo "$brew_dump" | grep 'mas ')

echo "$taps" >> ./packages/homebrew/taps
echo "$brew_packages" >> ./packages/homebrew/brew_packages
echo "$cask_packages" >> ./packages/homebrew/casks
echo "$mas_packages" >> ./packages/homebrew/mas
