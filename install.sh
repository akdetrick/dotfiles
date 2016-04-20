#!/bin/bash

# INSTALL

DOTFILES_PATH=./
BUNDLE_PATH=./bundle

read -p "WARNING!!!! This installation will rewrite local dotfiles without saving a backup. Continue? (y/n) " RESP
	if [ "$RESP" = "y" ]; then

		echo "~~~~~~~~ configuring vim..."
		rm ~/.vimrc
		ln -s $DOTFILES_PATH/.vimrc ~/.vimrc
		ln -s $DOTFILES_PATH/bundle ~/.vim/bundle
		mkdir -p ~/.vim/autoload
		curl -Sso ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

		echo "~~~~~~~~ installing vim-pathogen..."
		mkdir -p ~/.vim/autoload && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

		echo "~~~~~~~~ installing vim-pathogen bundles..."
		sed '1,/\"<pathogen>/d;/\"<\/pathogen>/,$d' $DOTFILES_PATH | sed -n 's/^.*\"<bundle>\([^<]*\).*/\1/p' > pathogen-bundles.txt
		for REPO in $(cut -d, -f2 < pathogen-bundles.txt)
		do
			cd $BUNDLE_PATH
			git clone $REPO
			cd ../
		done
		rm pathogen-bundles.txt

		echo "~~~~~~~~ linking git completion..."
		ln -s $DOTFILES_PATH/.git-completion.bash ~/.git-completion.bash

	else
		echo "Aborting installation"
fi

exit 0
