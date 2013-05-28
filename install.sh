#!/bin/bash

DOTFILES_PATH=~/dev/dotfiles

do

	echo "configuring vim..."
	rm ~/.vimrc
	ln -s $DOTFILES_PATH/.vimrc ~/.vimrc
	mkdir -p ~/.vim/autoload ~/.vim/bundle
	curl -Sso ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

done

exit 0
