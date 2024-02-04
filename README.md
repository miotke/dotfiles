# dotfiles

Dotfiles and other settings files.

### Neovim config

* Theme: [Everforest](https://github.com/sainnhe/everforest/tree/master) with manual install

### Install Instructions

Run `./bootstrap.py`

Running `bootstrap.py` does the following the things:
* Installs [Homebrew](https://brew.sh) as a macOS package manager
* Installs all items in the `INSTALL_PACKAGES` list
* Clones down this [dotfile](https://github.com/miotke/dotfiles) repo from GitHub
* Changes the default editor for Git to Neovim
* Generates symlinks for the following items
	* zshrc -> ~/.zshrc
	* nvim -> ~/.config


### Other Files

This repo also contains other configuration files and preferences.

* iTerm2 Settings

	* Ensure the following checkbox is checked: _Load preferences from a custom folder or URL:_
	* Point to the `~/dotfiles/iterm2-settings` folder
* VSCode Settings
	* `settings.json` contains all VSCode settings
	* `keybindings.json` contains all custom VSCode keybindings

