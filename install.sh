#!/bin/bash

arch="Arch Linux"
manjaro="Manjaro Linux"
debian="Debian GNU/Linux"

os=$(awk -F= '/^NAME/{gsub(/"/, "", $2); print $2}' /etc/os-release)

if [ "$os" == "$arch" ] | [ "$os" == "$manjaro" ]; then
    os=$arch
fi

if [ "$os" == "$arch" ]; then
    install_cmd="sudo pacman -S"
elif [ "$os" == "$debian" ]; then
    install_cmd="sudo apt-get install"
fi

function install {
    if ! command -v $1 &>/dev/null; then
        echo "Installing $1"
        eval "$install_cmd $1"
    fi
}

install "git"

install "zsh"
sudo chsh -s $(which zsh) "$USER"

install "curl"

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

install "stow"

# Stow all directories
for dir in */; do
    echo "Stowing ${dir::-1}"
    stow -D $dir
    stow $dir
done
