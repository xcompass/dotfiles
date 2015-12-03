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

uninstall_dotfiles () {
    for src in $(find $DOTFILES_ROOT -name '.*' ! -name '.git')
    do
        dst="$HOME/$(basename "${src}")"
        echo "Unlinking" $dst
        rm -f $dst
    done
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	install_dotfiles;
elif [ "$1" == "--uninstall" -o "$1" == "-u" ]; then
    uninstall_dotfiles;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		install_dotfiles;
	fi;
fi;
unset doIt;
