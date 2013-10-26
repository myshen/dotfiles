#!/bin/bash
function link {
    if [ ! -L $1 ]; then
        rm -rv $1
    fi
    ln -s -v -f $2
    chmod -h -v -v go-rwx $1
}
function link_dotfile {
    if [[ -e .dotfiles_local/$1 ]]; then
        link $1 .dotfiles_local/$1;
    else
        link $1 .dotfiles/$1;
    fi
}
function link_dotfiles {
    if [[ -e .dotfiles_local/$2 ]]; then
        link $1 .dotfiles_local/$2;
    else
        link $1 .dotfiles/$2;
    fi
}

cd ~;
link_dotfiles .vim          vim/.vim;
link_dotfiles .vimrc        vim/.vimrc;
link_dotfiles .bash_profile bash/.bash_profile;
link_dotfiles .bashrc       bash/.bashrc;
link_dotfiles .zshenv       zsh/.zshenv; 
link_dotfiles .zlogin       zsh/.zlogin; 
link_dotfiles .zshrc        zsh/.zshrc;  
link_dotfile .hushlogin;
link_dotfile .gitconfig;
link_dotfile .pythonstartup.py;
link_dotfile .screenrc;
link_dotfiles .tmux.conf    tmux/.tmux.conf;
