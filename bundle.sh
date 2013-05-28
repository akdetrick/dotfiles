#!/bin/bash

# testing a way to auto-install all pathogen bundles from vimrc structured comment

sed '1,/\"<pathogen>/d;/\"<\/pathogen>/,$d' ~/dev/dotfiles/.vimrc | cat

exit 0
