SHELL := /bin/bash
.POSIX:
# .PHONY: help

help: ## Show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

link-dotfiles: ## Links or relinks the dotfiles
	./install-dotfiles.sh

brew-dump: ## Remove the current Brewfile and dump a new one
	brew bundle dump --describe --force --file='~/.dotfiles/packages/Brewfile'

brew-install: ## Install all packages from Brewfile
	brew bundle --verbose --file ~/.dotfiles/packages/Brewfile
