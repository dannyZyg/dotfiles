SHELL := /bin/bash
.POSIX:
# .PHONY: help

help: ## Show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

link-dotfiles: ## Links or relinks the dotfiles
	./install-dotfiles.sh

brew-dump: ## Remove the current Brewfile and dump a new one
	rm ~/.dotfiles/packages/Brewfile
	brew bundle dump --describe --file='~/.dotfiles/packages/Brewfile'

make brew-install: ## Install all packages from Brewfile
	brew bundle --file ~/.dotfiles/packages/Brewfile
