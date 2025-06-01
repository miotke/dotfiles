# dotfiles

Dotfiles and other settings files.

### Install Instructions

Run `setup.py`

Running `setup.py` does the following the things:
* Installs [Homebrew](https://brew.sh) as a macOS package manager
* Installs homebrew packages
* Changes the default editor for Git to Neovim
* Generates symlinks for the following items
	* zshrc -> ~/.zshrc
	* nvim -> ~/.config
	* ghostty -> ~/.config

### Other Files

This repo also contains other configuration files and preferences.

* iTerm2 Settings
	* Ensure the following checkbox is checked: _Load preferences from a custom folder or URL:_
	* Point to the `~/dotfiles/iterm2-settings` folder
* keyboard_config/UltimateHackingKeyboard/UserConfiguration.json
	* Config for both Ultimate Hacking Keyboards
