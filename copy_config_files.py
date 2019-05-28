#!/usr/bin/env python3

"""
Copy the configuration files for VS Code and Sublime text to their appropriate locations
within the users library folders

Eventually I'll learn how to make symlinks for these files to make this easier with
less over head.

VS Code:
~/Library/Application Support/Code/User/

Sublime Text:
~/dotfiles/sublime_text/
"""

import os

def  move_vs_code():
    source_file = "~/dotfiles/vs_code/settings.json"
    destination = "~/Library/Application\ Support/Code/User"
    return os.system(f"cp {source_file} {destination}")


def move_sublime_text():
    source_file = "~/dotfiles/sublime_text/Preferences.sublime-settings"
    destination = "~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings"
    return os.system(f"cp {source_file} {destination}")


def copy_files():
    move_vs_code()
    move_sublime_text()


if __name__ == "__main__":
    copy_files()

