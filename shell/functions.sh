#!/bin/bash

function dockerDbIp {
	CONTAINER=$(grep DB_CONTAINER_NAME .env | sed 's/.*[=]//g')
	echo $(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $CONTAINER)
}

# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

function myip()
{
	echo $(curl http://checkip.amazonaws.com/)
}

function checkNet()
{
	if ping -c 1 google.com &>/dev/null; then
	  echo "It appears you have a working internet connection"
	else
		echo "NBN FUCKED!!!"
	fi
}

function showKeys()
{
	xev | awk -F'[ )]+' '/^KeyPress/ { a[NR+2] } NR in a { printf "%-3s %s\n", $5, $8 }'
}

function src()
{
	if [ "$SHELL" = '/usr/bin/bash' ] ; then
		source ~/.bashrc
	elif [ "$SHELL" = '/usr/bin/zsh' ] ; then
		source ~/.config/zsh/.zshrc
	fi
}

function rc()
{
	if [ "$SHELL" = '/usr/bin/bash' ] ; then
		$EDITOR ~/.bashrc
	elif [ "$SHELL" = '/usr/bin/zsh' ] ; then
		$EDITOR ~/.config/zsh/.zshrc
	fi
}

function rcloneRestore()
{
	rclone copy 'Backblaze encryption':$1 $HOME/restore/
}

# check file size
function fs() { du -sh ${1} | awk '{print $1}'; }

function gph()
{
	if ! git push
	then
		git push -u origin $(gcb)
	fi
}

function ripyt() {
	youtube-dl -f bestaudio --extract-audio --audio-format mp3 --audio-quality 0 $1
}

function pyenv-init() {
	dir=$(basename $(pwd))
	mkvirtualenv $dir
}

function pyenv-rm() {
	dir=$(basename $(pwd))
	rmvirtualenv $dir
}

function exists() {
	command -v $1 >/dev/null 2>&1
}

function zsh_add_plugin() {
    PLUGIN_NAME=$(echo $1 | cut -d "/" -f 2)
    if [ -d "$ZDOTDIR/plugins/$PLUGIN_NAME" ]; then
        # For plugins
        source "$ZDOTDIR/plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh" || \
        source "$ZDOTDIR/plugins/$PLUGIN_NAME/$PLUGIN_NAME.zsh"
    else
        git clone "https://github.com/$1.git" "$ZDOTDIR/plugins/$PLUGIN_NAME"
    fi
}

function fcd() {
	cd $(find . -type d | fzf)
}

function fgco() {
	git checkout $(git branch | fzf)
}

function ftmux() {
	$(find ~/sync/scripts/tmux/*.sh | fzf)
}

function awsp() {
	AWS="${1:-${AWS_PROFILE}}"
	export AWS_PROFILE=$AWS
	echo $AWS
	alias aws="aws --profile $AWS_PROFILE"
}
