#!/bin/bash

dotfilesDir="${HOME}/.dotfiles"
backupDir="${HOME}/.dotfiles/backups"

function print_banner() {
	echo ''
	echo '##############################'
	echo $1
	echo '##############################'
	echo ''
}

function createDir() {
	if [ ! -d "${1}" ]; then
		echo "Creating directory for ${1}"
		mkdir -p ${1}
	fi
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
    createDir ${backupDir}/${destDir}
    mv ${HOME}/${destFile} ${backupDir}/${destFile}_${dateStr}
  fi

  echo "Creating new symlink: ${PWD}/${destFile} -> ${HOME}/${destFile}"
  createDir ${HOME}/${destDir}
  ln -s ${PWD}/${destFile} ${HOME}/${destFile}
}

function createNvimDirs() {
	echo "Creating nvim dirs..." ; echo ""
	createDir ~/.config/nvim/plugin
	createDir ~/.config/nvim/after/plugin
	createDir ~/.config/nvim/lua
}

function linkNvimFiles() {
	for f in .config/nvim/plugin/* ; do
		linkDotfile $f
	done
}

function createLinks() {
	linkDotfile .config/nvim/init.vim
	linkDotfile .config/zsh/.zshrc
	linkDotfile .config/zsh/.p10k.zsh
	linkDotfile .zprofile
	linkDotfile .config/tmux/.tmux.conf
	linkDotfile .gitconfig

	if [[ "$OSTYPE" == "linux-gnu"* ]]; then
		print_banner 'Completing steps for LINUX'
		linkDotfile .config/i3/config
		linkDotfile .config/i3/i3-scrot.conf
		linkDotfile .config/sxhkd/sxhkdrc
		linkDotfile .config/bspwm/bspwmrc
		linkDotfile .config/picom/picom.conf
		linkDotfile .xprofile

		# linkDotfile .inputrc
		# linkDotfile .xinitrc
	elif [[ "$OSTYPE" == "darwin"* ]]; then
		print_banner 'Completing steps for DARWIN'
	fi
}

function install_cl_tools() {
	xcode-select --install
}

print_banner 'Linking dotfiles...'

createDir ${backupDir} \
	& createLinks \
	& createNvimDirs \
	& linkNvimFiles

# linkDotfile .ackrc
# linkDotfile .goomwwmrc
# linkDotfile .curlrc
# linkDotfile .gf


# setupNvimPlugins
