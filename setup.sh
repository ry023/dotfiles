#!/bin/sh

DOTFILES_PATH="$(cd $(dirname $0); pwd)"

ln -sf $DOTFILES_PATH/_vimrc $HOME/.vimrc
