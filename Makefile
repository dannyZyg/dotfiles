SHELL := /bin/bash
.POSIX:
# .PHONY: help

help: ## Show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

link-dotfiles: ## Links or relinks the dotfiles
	./install-dotfiles.sh

brew-dump: ## Remove the current Brewfile and dump a new one (arm)
	brew bundle dump --describe --force --file='~/.dotfiles/packages/Brewfile'

brew-x86-dump: ## Remove the current Brewfile and dump a new one (x86)
	arch -x86_64 /usr/local/bin/brew bundle dump --describe --force --file='~/.dotfiles/packages/Brewfile-x86'

brew-install: ## Install all packages from Brewfile (arm)
	brew bundle --verbose --file ~/.dotfiles/packages/Brewfile

brew-x86-install: ## Install all packages from Brewfile (x86)
	arch -x86_64 /usr/local/bin/brew bundle --verbose --file ~/.dotfiles/packages/Brewfile-x86

git-submodule-update: ## Updates git submodules
	git submodule update --remote --merge
