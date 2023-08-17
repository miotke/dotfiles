# dotfiles

Dotfiles and other settings files.

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
	* Settings for VS Code


### Other Files

This repo also contains other configuration files and preferences

* iTerm2 Settings

	* Ensure the following checkbox is checked: _Load preferences from a custom folder or URL:_
	* Point to the `~/dotfiles/iterm2-settings` folder
* VSCode Settings
	* `settings.json` contains all VSCode settings
	* `keybindings.json` contains all custom VSCode keybindings

### Shortcuts

| Command   |          Action                                  |
|-----------|--------------------------------------------------|
|`ctrl-n`   | open\close NERDTree                              |
|`ctrl-ww`  | focus\unfocus NERDTree or another split file     |
|`s`        | open a verticle split with another selected file |
|`i`        | open horizontal split with another selected file |
|`\cc`      | comment a line with NERDCommenter                |
|`\cu`      | uncomment a line with NERDCommenter              |
|`0`        | jump to front of the line                        |
|`4`        | jump to the end of the line                      |
|`zz`       | focus selected line to the center                |
|`y`        | copy selected text                               |
|`p`        | paste copied text                                |
|`d`        | cut selected text                                |
|`ctrl-r`   | Re-do changes                                    |
