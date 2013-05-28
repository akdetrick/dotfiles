#!/bin/bash

DOTFILES_PATH=~/dev/dotfiles

echo "configuring vim..."
rm ~/.vimrc
ln -s $DOTFILES_PATH/.vimrc ~/.vimrc
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -Sso ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

exit 0
