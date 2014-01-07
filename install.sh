#!/bin/bash

# INSTALL

DOTFILES_PATH=~/dev/dotfiles

read -p "WARNING!!!! This installation will rewrite local dotfiles without saving a backup. Continue? (y/n) " RESP
	if [ "$RESP" = "y" ]; then

		echo "~~~~~~~~ configuring vim..."
		rm ~/.vimrc
		ln -s $DOTFILES_PATH/.vimrc ~/.vimrc
		mkdir -p ~/.vim/autoload ~/.vim/bundle
		curl -Sso ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

		echo "~~~~~~~~ installing vim-pathogen bundles..."
		cd ~/.vim/bundle
		sed '1,/\"<pathogen>/d;/\"<\/pathogen>/,$d' ~/dev/dotfiles/.vimrc | sed -n 's/^.*\"<bundle>\([^<]*\).*/\1/p' > pathogen-bundles.txt
		for REPO in $(cut -d, -f2 < pathogen-bundles.txt)
		do
			git clone $REPO
		done
		rm pathogen-bundles.txt

		echo "~~~~~~~~ configuring iterm2..."
		ln -s $DOTFILES_PATH/com.googlecode.iterm2.plist ~/Library/Preferences/com.googlecode.iterm2.plist

		#echo "~~~~~~~~ installing powerline-bash..."
		#cd ~/dev/dotfiles/powerline-bash
		#python install.py
		#ln -s $DOTFILES_PATH/powerline-bash/powerline-shell.py ~/powerline-shell.py

		#echo "=== NOTE: powerline-bash requires an addition in .bashrc (will fix this later) ==="
		#echo "=== see https://github.com/akdetrick/powerline-bash/blob/master/README.md ==="

		echo "~~~~~~~~ linking git completion..."
		ln -s $DOTFILES_PATH/.git-completion.bash ~/.git-completion.bash

	else
		echo "Aborting installation"
fi

exit 0
