#!/bin/bash

# UPDATE - pulls updates for all installed vim-pathogen bundles; maybe more later

DOTFILES_PATH=~/dev/dotfiles

cd $DOTFILES_PATH
git pull

echo "~~~~~~~~ updating vim bundles..."
cd ~/.vim/bundle
for directory in `ls ~/.vim/bundle`
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
