#! /bin/bash

apt-get install neovim

sudo apt-get install exuberant-ctags pandoc tree

curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
