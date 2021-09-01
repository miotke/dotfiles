#!/usr/bin/env python

# This is a small and novice script that helps bootstrap the setup
# of a new Mac. Continue to add to it by creating other functions below.

import os

# Installs Homebrew and various packages
INSTALL_PACKAGES = [
    # Install Homebrew
    '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"',
    # Install MonitorControl
    "brew install --cask monitorcontrol",
    # Install DB Browser for SQLite
    "brew cask install db-browser-for-sqlite",
    # Install tree
    "brew install tree",
    # Install the GitHub CLI tools
    "brew install gh",
    # Install htop
    "brew install htop",
    # Install vim-plug for Neovim
    "curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    # Install Neovim
    "brew install neovim"
    # Install oh-my-zsh
    'sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"',
]

SYMLINK_FILES = ["vimrc", "zshrc"]
HOME = os.environ["HOME"]


def install_from_homebrew():
    for command in INSTALL_PACKAGES:
        try:
            print(f"Installing {command}")
            os.system(command)
        except:
            print(f"Failed to install {command}")


def create_directories():
    # Creats a directory for all Git repos
    os.system("mkdir ~/Developer")


def setup_commands():
    # Enables build times in Xcode. This might not be needed in Xcode 13
    show_xcode_build_times = ("defaults write com.apple.dt.Xcode ShowBuildOperationDuration YES")
    os.system(show_xcode_build_times)

    # Changes the default git editor to Neovim
    os.system("git config --global core.editor nvim")


def create_symlinks():
    # Creates symlinks for vimrc and zshrc
    for file in SYMLINK_FILES:
        print(f"Creating sym links for {file}")
        os.system(f"ln -s {HOME}/dotfiles/{file} ~/.{file}")

    # Creates a symlink for the nvim folder which contains all Neovim config files
    os.system(f"ln -s {HOME}/dotfiles/nvim {HOME}/.config")


def vs_code_settings():
    # Creates symlinks for VSCode preferences
    os.system("ln -s ~/dotfiles/settings.json /Users/andrewmiotke/Library/Application\ Support/Code/User/settings.json")
    os.system("ln -s ~/dotfiles/keybindings.json /Users/andrewmiotke/Library/Application\ Support/Code/User/keybindings.json")


if __name__ == "__main__":
    install_from_homebrew()
    create_directories()
    setup_commands()
    create_symlinks()

