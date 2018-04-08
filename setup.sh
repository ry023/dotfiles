#!/bin/sh

DOTFILES_PATH="$(cd $(dirname $0); pwd)"

ln -s $DOTFILES_PATH/_vimrc $HOME/.vimrc
ln -s $DOTFILES_PATH/_bashrc $HOME/.bashrc
