SHELL := /bin/bash
.POSIX:
# .PHONY: help

help: ## Show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

dotbot-run: ## Runs the dotbot install script
	./install

brew-dump: ## Remove the current Brewfiles (brew, tap, cask, mas) and dump new ones
	./scripts/brew-dump.sh

brew-x86-dump: ## Remove the current Brewfile and dump a new one (x86)
	arch -x86_64 /usr/local/bin/brew bundle dump --describe --force --file='~/.dotfiles/packages/Brewfile-x86'

brew-install-brews: ## Install all brews from Brewfile
	brew bundle --file ./packages/homebrew/brew_packages

brew-install-taps: ## Install all taps from Brewfile
	brew bundle --file ./packages/homebrew/taps

brew-install-casks: ## Install all casks from Brewfile
	brew bundle --file ./packages/homebrew/casks

brew-install-mas: ## Install all Mac App Store apps from Brewfile
	brew bundle --file ./packages/homebrew/mas

git-submodule-update: ## Updates git submodules
	git submodule update --remote --merge

## Docker commands to test out ansible playbook in a sandbox environment. ##

docker-build: ## Build the arch docker container
	docker build -t arch .

docker-run: ## Enter the arch docker container
	docker run -it --rm -u danny arch bash

docker-reload:
	make docker-build && make docker-run

docker-refresh:
	docker build --no-cache -t arch . && make docker-run
