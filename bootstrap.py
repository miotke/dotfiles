#!/usr/bin/env python

# This is a small and novice script that helps bootstrap the setup
# of a new Mac. Continue to add to it by creating other functions below.

import os

# Installs Homebrew and various applications
command_line_installs = [
    # Install Homebrew
    '/bin/bash -c \"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)\"',

    # Install vim
    'brew install vim',

    # Install MonitorControl
    'brew cask install monitorcontrol',

    # Install DB Browser for SQLite
    'brew cask install db-browser-for-sqlite',

    # Install tree
    'brew install tree',

    # Install the GitHub CLI tools
    'brew install gh',

    # Install htop
    'brew install htop',

    # Install vim-plug
    'curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
                https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim',

    # Install oh-my-zsh
    'sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"',
]


sym_link_files = ['vimrc', 'zshrc']


def install_from_homebrew():
    for command in command_line_installs:
        print(f'Installing {command}...')
        os.system(command)


def create_directories():
    # Creats a directory for all Git repos that I work in.
    os.system('mkdir ~/Developer')


def setup_commands():
    show_xcode_build_times = 'defaults write com.apple.dt.Xcode ShowBuildOperationDuration YES'

    os.system(show_xcode_build_times)


def create_sym_links():
    # Creates sym links for vimrc, zshrc, ect.
    for file in sym_link_files:
        print(f'Creating sym links for {file}')
        os.system(f'ln -s ~/dotfiles/{file} ~/.{file}')


if __name__ == '__main__':
    install_from_homebrew()
    create_directories()
    setup_commands()
    create_sym_links()

