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

install "stow"
# Stow all directories
for dir in */; do
    echo "Stowing ${dir::-1}"
    stow -D $dir
    stow $dir
done

install "git"

install "zsh"
sudo chsh -s $(which zsh) "$USER"

install "curl"

if [[ ! -d "$HOME/antigen.zsh" ]]; then
    curl -L git.io/antigen > $HOME/antigen.zsh
fi

if [ "$os" == "$arch" ]; then
    if ! command -v pacaur &>/dev/null; then
        temp_dir=$(mktemp -d)

        git clone https://aur.archlinux.org/pacaur.git $temp_dir

        $(cd $temp_dir && makepkg -sri)
    fi
fi

# Vim
install "neovim"

if [[ ! -d "$HOME/.spf13-vim-3" ]]; then
    # Install spf13-vim
    sh <(curl https://j.mp/spf13-vim3 -L)
fi

# Pyenv
if [[ ! -d "$HOME/.pyenv" ]]; then
    curl https://pyenv.run | bash
fi

# Node Version Manager
if [[ ! -d "$HOME/.pyenv" ]]; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.1/install.sh | bash
fi
