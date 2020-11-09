#!/bin/bash

dotfilesDir="${HOME}/dotfiles"
backupDir="${HOME}/dotfiles/backups"

# function createBackupSubDir() {
# 	if [ ! -d "${backupDir}/${1}" ]; then
# 		echo "Creating backup sub directory for $1"
# 		mkdir -p ${backupDir}/${1}
# 	fi
# }

# function createConfigSubDir() {
# 	if [ ! -d "${HOME}/${1}" ]; then
# 		echo "Creating config sub directory for $1"
# 		mkdir -p ${HOME}/${1}
# 	fi
# }

function createDir() {
	if [ ! -d "${1}" ]; then
		echo "Creating directory for ${1}"
		mkdir -p ${1}
	fi
}

function setupNvimPlugins() {
	sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
		   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	nvim +PluginInstall +qall
}

function linkDotfile {
  destFile="${1}"
  destDir=$(dirname ${destFile})
  dateStr=$(date +%Y-%m-%d-%H%M)

  if [ -h "${HOME}/${destFile}" ]; then
    echo "Removing existing symlink: ${HOME}/${destFile}"
	rm ${HOME}/${destFile}

  elif [ -f "${HOME}/${destFile}" ]; then
    echo "Backing up existing file: ${destFile}"
	createDir ${HOME}/${destDir}
    mv ${HOME}/${destFile} ${backupDir}/${destFile}_${dateStr}
  fi

  echo "Creating new symlink: ${PWD}/${destFile} -> ${HOME}/${destFile}"
  createDir ${HOME}/${destDir}
  ln -s ${PWD}/${destFile} ${HOME}/${destFile}
}

function createLinks() {
	linkDotfile .config/nvim/init.vim
	linkDotfile .config/zsh/.zshrc
	linkDotfile .zprofile
	linkDotfile .config/tmux/.tmux.conf

	if [[ "$OSTYPE" == "linux-gnu"* ]]; then
		linkDotfile .config/i3/config
		linkDotfile .config/i3/i3-scrot.conf
		linkDotfile .xprofile

		# linkDotfile .inputrc
		# linkDotfile .xinitrc
	elif [[ "$OSTYPE" == "darwin"* ]]; then
		date=$(date -v-1d '+%Y%m%d')
	fi
}

createDir ${backupDir} \
	& createLinks

# linkDotfile .ackrc
# linkDotfile .gitconfig
# linkDotfile .goomwwmrc
# linkDotfile .curlrc
# linkDotfile .gf


# setupNvimPlugins
