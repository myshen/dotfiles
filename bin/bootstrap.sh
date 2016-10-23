#!/bin/bash

set -x
set -eu

HERE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. "$HERE/../bash-like-common/functions"

dep_pyenv() {
	brew install pyenv-virtualenv
}

dep_cabal() {
	apt-get install cabal
}

dependencies() {
	# powerline
	dep_pyenv && {
		pyenv virtualenv global
	}
	/Users/mattshen/.pyenv/versions/global/bin/pip install powerline-status
	# base16-shell
	git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell || :
	# tmux
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm || :
	# vim/NeoBundle
	git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim || :
	dep_cabal && {
		cabal update
		cabal install shellcheck
	} || :
}

link() {
	if [ ! -L "$1" ]; then
		rm -v -r "$1" || true
	fi
	ln -v -s -f -h "$2" "$1"
	if [[ platform == 'bsd' ]]; then
		chmod -h -v -v go-rwx "$1"
	else
		chmod -v go-rwx "$1"
	fi
}

link_dotfile() {
	if [[ -e .dotfiles_local/$1 ]]; then
		link "$1" ".dotfiles_local/$1";
	else
		link "$1" ".dotfiles/$1";
	fi
}

link_dotfiles() {
	if [[ -e .dotfiles_local/$2 ]]; then
		link "$1" ".dotfiles_local/$2";
	else
		link "$1" ".dotfiles/$2";
	fi
}

dotlinks() {
	cd ~
	mkdir -p .config/powerline
	link_dotfiles   .desk		   desk
	link_dotfiles   .vim			vim/vim
	link_dotfiles   .vimrc		  vim/vimrc
	link_dotfiles   .bash_profile	   bash/bash_profile
	set +x
	link_dotfiles   .bashrc		 bash/bashrc
	link_dotfiles   .zshenv		 zsh/zshenv
	link_dotfiles   .zlogin		 zsh/zlogin
	link_dotfiles   .zshrc		  zsh/zshrc
	link_dotfiles   .tmux		   tmux
	link		.tmux.conf		  .tmux/tmux.conf
	link		.config/powerline/tmux  .tmux/powerline
	link_dotfiles   .gitconfig		  git/gitconfig
	link_dotfiles   .pythonstartup.py	   pythonstartup.py
	link_dotfiles   .screenrc		   screenrc
	link_dotfile	.hushlogin
}

dotlinks
dependencies
