#!/usr/bin/env python

# This is a small and novice script that helps bootstrap the setup 
# of a new Mac. Continue to add to it by creating other functions below.

import os

# Installs Homebrew and various applications
homebrew = '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"'
oh-my-zsh = 'sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"'
vim = 'brew install vim'
clone_dotfiles = 'https://github.com/miotke/dotfiles.git ~/dotfiles'

def install_from_homebrew():
    os.system(homebrew)
    os.system(oh-my-zsh)
    os.system(vim)
    os.system(clone_dotfiles)

if __name__ == "__main__":
    install_from_homebrew()
