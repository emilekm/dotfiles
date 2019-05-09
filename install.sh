#!/bin/bash

if ! command -v git &>/dev/null; then
    sudo pacman -S git
fi

if ! command -v zsh &>/dev/null; then
    sudo pacman -S zsh
    chsh -s $(which zsh)
fi

if ! command -v curl &>/dev/null; then
    sudo pacman -S curl
fi

if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

if ! command -v pacaur &>/dev/null; then
    temp_dir=$(mktemp -d)

    git clone https://aur.archlinux.org/pacaur.git $temp_dir

	$(cd $temp_dir && makepkg -sri)
fi

if ! command -v stow &>/dev/null; then
    sudo pacman -S stow
fi


# Stow all directories
for dir in */; do
    echo "Stowing ${dir::-1}"
    stow -D $dir
    stow $dir
done
