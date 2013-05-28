#!/bin/bash

# INSTALL

DOTFILES_PATH=~/dev/dotfiles

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

exit 0
