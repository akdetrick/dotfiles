#!/bin/bash

# UPDATE - pulls updates for all installed vim-pathogen bundles; maybe more later

DOTFILES_PATH=~/dev/dotfiles
BUNDLE_PATH=./bundle

cd $DOTFILES_PATH
git pull

echo "~~~~~~~~ installing new vim-pathogen bundles listed in vimrc..."
cd ~/.vim/bundle
sed '1,/\"<pathogen>/d;/\"<\/pathogen>/,$d' ~/dev/dotfiles/.vimrc | sed -n 's/^.*\"<bundle>\([^<]*\).*/\1/p' > pathogen-bundles.txt
for REPO in $(cut -d, -f2 < pathogen-bundles.txt)
do
	git clone $REPO
done
rm pathogen-bundles.txt

echo "~~~~~~~~ updating vim bundles..."
cd $BUNDLE_PATH
for directory in `ls $BUNDLE_PATH`
do
	echo "Checking for $directory update..."
	if [ -d "$directory/.git" ]
	then
		cd $directory
		git pull
		cd ..
	else
		echo "$directory not a git plugin. Skipping update."
	fi
	echo "\n"
done

exit 0
