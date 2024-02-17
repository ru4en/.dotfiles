#!/bin/bash
#
# Author: Ruben Lopes
#
# Setup script for dotfiles

# function to check what package manager is installed
get_package_manager() {
    if [ -x "$(command -v apt-get)" ]; then
        echo "apt"
    elif [ -x "$(command -v dnf)" ]; then
        echo "dnf"
    elif [ -x "$(command -v yum)" ]; then
        echo "yum"
    elif [ -x "$(command -v pacman)" ]; then
        echo "pacman"
    elif [ -x "$(command -v zypper)" ]; then
        echo "zypper"
    else
        echo "unknown"
    fi
}

# Install dependencies
package_manager=$(get_package_manager)
packages="git zsh vim tmux curl cmake gcc-c++ make python3-devel"

if [ "$package_manager" = "apt" ]; then
    sudo apt update
    sudo apt install -y $packages
elif [ "$package_manager" = "dnf" ] || [ "$package_manager" = "yum" ]; then
    sudo yum install -y $packages
elif [ "$package_manager" = "pacman" ]; then
    sudo pacman -Syu --noconfirm $packages
elif [ "$package_manager" = "zypper" ]; then
    sudo zypper install -y $packages
else
    echo "Unknown package manager"
    exit 1
fi

ln -sf vim/vimrc ~/.vimrc
ln -sf zsh/zshrc ~/.zshrc
# ln -sf tmux/tmux.conf ~/.tmux.conf

# Install Vim Plug
if [ ! -f ~/.vim/autoload/plug.vim ]; then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Install Oh My Zsh
if [ ! -d ~/.oh-my-zsh ]; then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

