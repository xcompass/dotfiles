#!/usr/bin/env bash

# cd "$(dirname "${BASH_SOURCE}")";

# git pull origin master;

DOTFILES_ROOT=$(pwd)

install_dotfiles () {
    for src in $(find $DOTFILES_ROOT -name '.*' ! -name '.git')
    do
        dst="$HOME/$(basename "${src}")"
        echo "Linking " $src "->" $dst
        ln -F -s "$src" "$dst"
    done
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	install_dotfiles;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		install_dotfiles;
	fi;
fi;
unset doIt;
