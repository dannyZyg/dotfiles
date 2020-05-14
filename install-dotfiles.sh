#!/bin/bash
dotfilesDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

function linkDotfile {
  dest="${2}"
  dateStr=$(date +%Y-%m-%d-%H%M)

  if [ -h ~/${1} ]; then
    # Existing symlink 
    echo "Removing existing symlink: ${dest}"
    rm ${dest} 

  elif [ -f "${dest}" ]; then
    # Existing file
    echo "Backing up existing file: ${dest}"
    mv ${dest}{,.${dateStr}}

  elif [ -d "${dest}" ]; then
    # Existing dir
    echo "Backing up existing dir: ${dest}"
    mv ${dest}{,.${dateStr}}
  fi

  echo "Creating new symlink: ${dest}"
  ln -s ${dotfilesDir}/${1} ${dest}
}

# linkDotfile .vim
linkDotfile .vimrc ~
# linkDotfile .ackrc
linkDotfile .bashrc ~
linkDotfile i3/config ~/.config/i3/config
# linkDotfile .gitconfig
# linkDotfile .tmux.conf
# linkDotfile .goomwwmrc
# linkDotfile .inputrc
# linkDotfile .xinitrc
# linkDotfile .curlrc
# linkDotfile .gf

# mkdir -p $dotfilesDir/.vim/bundle
# [ -d foo ] || mkdir foo
# cd $dotfilesDir/.vim/bundle
# git clone git://github.com/VundleVim/Vundle.vim.git
# vim +PluginInstall +qall
