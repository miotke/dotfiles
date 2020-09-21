#!/bin/bash

# Makes a copy of Xcode's keybinds and saves it 
# to my dotfiles directory to be backed up and held
# in version control using GitHub.

xcode_preferences_path=~/Library/Developer/Xcode/UserData/
save_path=~/dotfiles/xcode_preferences/

echo Backing up Xcode settings...

echo Copying Xcode keybinds to $save_path...
echo 
cp $xcode_preferences_path/KeyBindings/Default.idekeybindings $save_path

