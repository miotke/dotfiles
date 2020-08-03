#!/usr/bin/env python

# This is a small and novice script that helps bootstrap the setup 
# of a new Mac. Continue to add to it by creating other functions below.

import os

# Installs Homebrew and various applications
command_line_installs = [
    # Install Homebrew
    "/bin/bash -c \"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)\"",
    # Install oh-my-zsh
    'sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"',
    # Install vim
    'brew install vim',
    # Clone dotfiles repo
    'https://github.com/miotke/dotfiles.git ~/dotfiles'
]


def install_from_homebrew():
    for commands in command_line_installs:
        os.system(commands)


def create_directories():
	os.system('mkdir ~/Desktop/stuff')


if __name__ == "__main__":
    install_from_homebrew()
	create_directories()
