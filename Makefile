SHELL := /bin/bash
.POSIX:
# .PHONY: help

help: ## Show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

dotbot-run: ## Runs the dotbot install script
	./install

git-submodule-update: ## Updates git submodules
	git submodule update --remote --merge
