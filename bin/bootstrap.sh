#!/bin/bash

set -eu;

platform() {
	platform='unknown'
	unamestr=$(uname)
	if [[ "$unamestr" == 'Linux' ]]; then
		platform='linux'
	elif [[ "$unamestr" == 'darwin' ]]; then
		platform='osx'
	elif [[ "$unamestr" == 'cygwin' ]]; then
		platform='win32'
	elif [[ "$unamestr" == 'FreeBSD' ]]; then
		platform='bsd'
	fi
	return $platform
}

dependencies() {
	# tmux
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm || :
	# vim/NeoBundle
	git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim || :
}

link() {
	if [ ! -L "$1" ]; then
		rm --verbose --recursive "$1" || true
	fi
	ln --verbose --symbolic --force --no-dereference "$2" "$1"
	if [[ platform == 'bsd' ]]; then
		chmod -h -v -v go-rwx "$1"
	else
		chmod --verbose go-rwx "$1"
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
