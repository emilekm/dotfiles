#!/bin/bash

function install {
    arch="Arch Linux"
    manjaro="Manjaro Linux"
    debian="Debian GNU/Linux"

    os=$(awk -F= '/^NAME/{gsub(/"/, "", $2); print $2}' /etc/os-release)
    echo "$os"
    echo "$manjaro"
    if [ "$os" == "$arch" ] | [ "$os" == "$manjaro" ]; then
        echo $1
        sudo pacman -S "$1"
    elif [ "$os" == "$debian" ]; then
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
