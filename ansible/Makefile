SHELL := /bin/bash
.POSIX:
# .PHONY: help

help: ## Show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

all: ## Run the full ansible playbook
	ansible-playbook local.yml --ask-vault-pass --ask-become-pass

apple: ## Setup Apple system settings
	ansible-playbook local.yml -t apple

build-packages: ## Build packages from src
	ansible-playbook local.yml -t build-packages --ask-become-pass

dotfiles: ## Install dotfiles with dotbot
	ansible-playbook local.yml -t dotfiles

facts: ## Gather ansible facts
	ansible all -m gather_facts

node: ## Install Node, N and npm packages
	ansible-playbook local.yml -t node --ask-become-pass

npm: ## Install npm packages
	ansible-playbook local.yml -t npm

node-npm: ## Install Node, N and npm packages
	ansible-playbook local.yml -t node,npm --ask-become-pass

espanso-unpack: ## Decrypt espanso repo files into the config path
	ansible-playbook local.yml -t espanso --ask-vault-pass

espanso-pack: ## Encrypt the system espanso files - overwrites repo files
	./scripts/encrypt-espanso-conf.sh

debug: ## Print out env vars
	ansible-playbook local.yml -t debug

pacman-install: ## Install pacman packages
	ansible-playbook local.yml -t pacman --ask-become-pass

apt-install: ## Install pacman packages
	ansible-playbook local.yml -t apt --ask-become-pass

install-packages: ## Install all packages
	ansible-playbook local.yml -t packages --ask-become-pass

pacman-aur-install: ## Install aur packages
	ansible-playbook local.yml -t aur --ask-become-pass

flatpak-install: ## Installs flatpak packages
	ansible-playbook local.yml -t flatpak --ask-become-pass

pull-repos: ## Pulls my github repos
	ansible-playbook local.yml -t repos

python: ## Installs Python with conda
	ansible-playbook local.yml -t python --ask-become-pass

pipx: ## Installs pipx pachages
	ansible-playbook local.yml -t pipx

rust: ## Installs rust and any global cargo packages
	ansible-playbook local.yml -t rust

shell: ## Installs zsh and related tools, sets the default shell
	ansible-playbook local.yml -t shell --ask-become-pass --ask-vault-pass

ssh: ## Decrypts the ssh config file
	ansible-playbook local.yml -t ssh --ask-vault-pass

system-files: ## Installs any system files
	ansible-playbook local.yml -t system --ask-become-pass
