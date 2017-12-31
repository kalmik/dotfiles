#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ "$(uname)" == "Darwin" ]; then
    brew install tmux
    brew install reattach-to-user-namespace
    brew install vim
    ln -sfv "$DIR/.bash_profile" ~/.bash_profile
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    sudo apt-get install tmux
    sudo apt-get install vim
    sudo apt-get install curl
    ln -sfv "$DIR/.bashrc" ~/.bashrc
fi



ln -sfv "$DIR/.vimrc" ~/.vimrc
ln -sfv "$DIR/.tmux.conf" ~/.tmux.conf
ln -sfv "$DIR/.gitconfig" ~/.gitconfig
ln -sfv "$DIR/.gitignore" ~/.gitignore
ln -sfv "$DIR/.gitignore_global" ~/.gitignore_global
