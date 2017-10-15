#!/bin/bash

set -o nounset
set -o errexit
set -o pipefail

HERE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. "$HERE/../bash-like-common/functions"

dep_pyenv() {
	brew install pyenv-virtualenv
}

dep_pyenv_custom() {
	set +u
	py3="3.6.0"
	py2="2.7.10"
	pyenv virtualenv global || :

	pyenv virtualenv "$py3" jupyter3 || :
	pyenv activate jupyter3
	pip install jupyter
	python -m ipykernel install --user

	pyenv virtualenv "$py2" ipython2 || :
	pyenv activate ipython2
	pip install ipykernel
	python -m ipykernel install --user

	pyenv virtualenv "$py3" tools3 || :
	pyenv activate tools3
	pip install ipython pytest virtualenv yamllint zc.buildout pipreqs pip-tools \
		pex leak flake8 autopep8 docker-compose ansible-lint awscli awscli-cwlogs \
		yapf

	pyenv virtualenv "$py2" tools2 || :
	pyenv activate tools2
	pip install yapf futures

	pyenv global "$py3" "$py2" jupyter3 ipython2 tools3 tools2
	set -u
}

dep_cabal() {
	apt-get install cabal
}

dependencies() {
	# powerline
	dep_pyenv && dep_pyenv_custom
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
	if [[ $(platform) == 'bsd' ]]; then
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
	link_dotfiles   .bashrc		 bash/bashrc
	link_dotfiles   .zshenv		 zsh/zshenv
	link_dotfiles   .tmux		   tmux
	link		.tmux.conf		  .tmux/tmux.conf
	link		.config/powerline/tmux  .tmux/powerline
	link_dotfiles   .gitconfig		  git/gitconfig
	link_dotfiles   .pythonstartup.py	   pythonstartup.py
	link_dotfiles   .screenrc		   screenrc
	link_dotfile	.hushlogin
}

main() {
	dotlinks
	dependencies
}

if [[ "$0" = "${BASH_SOURCE[*]}" ]]; then
	main "$@"
fi
