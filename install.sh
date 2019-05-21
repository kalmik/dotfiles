#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.2
git clone https://github.com/asdf-vm/asdf.git ~/.asdf
cd ~/.asdf
git checkout "$(git describe --abbrev=0 --tags)"


if [ "$(uname)" == "Darwin" ]; then
    brew install tmux
    brew install reattach-to-user-namespace
    brew install vim
    ln -sfv "$DIR/.bash_profile" ~/.bash_profile
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    sudo apt-get -y install tmux  vim-gtk curl snapd
    sudo apt-get -y install build-essential autoconf install libncurses5-dev libssl-dev
    snap install pycharm-community clion intellij-idea-community --classic
    ln -sfv "$DIR/.bashrc" ~/.bashrc
fi

asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone git@github.com:seebi/dircolors-solarized.git
mkdir -p ~/.vim/colors

cp -r ./vim/colors/* ~/.vim/colors

touch ~/.env
ln -sfv "$DIR/.vimrc" ~/.vimrc
ln -sfv "$DIR/.tmux.conf" ~/.tmux.conf
ln -sfv "$DIR/.gitconfig" ~/.gitconfig
ln -sfv "$DIR/.gitignore" ~/.gitignore
ln -sfv "$DIR/.gitignore_global" ~/.gitignore_global
ln -sfv "$DIR/.hgignore_global" ~/.hgignore_global
ln -sfv "$DIR/.hgrc" ~/.hgrc

vim +PluginInstall +qall
