#!/usr/bin/env python3

"""
Copy the configuration files for VS Code and its  appropriate location
within the users library folder

VS Code:
~/Library/Application Support/Code/User/
"""

import os

def  move_vs_code():
    source_file = "~/dotfiles/vs_code/settings.json"
    destination = "~/Library/Application\ Support/Code/User"
    return os.system(f"cp {source_file} {destination}")


def copy_vim_colors():
    source_file = "~/dotfiles/colors"
    destination = "~/.vim/"
    return os.system(f"cp {source_file} {destination}")


def copy_files():
    move_vs_code()
    copy_vim_colors()


def setup()
    copy_files()
    os.system('./makesymlinks.sh')


if __name__ == "__main__":
    setup()

