#!/bin/bash

function install() {
    os=$(awk -F= '/^NAME/{print $2}' /etc/os-release)
    if [ "$os" == "Arch Linux" ]; then
        sudo pacman -S "$1"
    elif [ "$os" == "Debian GNU/Linux" ]; then
        sudo apt-get install "$1"
    fi
}

if ! command -v git &>/dev/null; then
    install "git"
fi

if ! command -v zsh &>/dev/null; then
    install "zsh"
    sudo chsh -s $(which zsh) "$USER"
fi

if ! command -v curl &>/dev/null; then
    install "curl"
fi

if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

if ! command -v pacaur &>/dev/null; then
    if command -v pacman &>/dev/null; then
        temp_dir=$(mktemp -d)

        git clone https://aur.archlinux.org/pacaur.git $temp_dir

        $(cd $temp_dir && makepkg -sri)
    fi
fi

if ! command -v stow &>/dev/null; then
    install "stow"
fi


# Stow all directories
for dir in */; do
    echo "Stowing ${dir::-1}"
    stow -D $dir
    stow $dir
done
