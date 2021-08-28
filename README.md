# dotfiles

💻 This repo holds my dotfiles which are very minimal and a bootstrap script to setup a new Mac. 

### Install Instructions

Run `./bootstrap.py`

Running `bootstrap.py` does the following the things:
* Installs [Homebrew](https://brew.sh) as a macOS package manager
* Installs [oh-my-zsh](https://ohmyz.sh) for zsh configuration management
* Installs Vim from Homebrew
* Clones down this [dotfile](https://github.com/miotke/dotfiles) repo from GitHub
* Installs [DB Browser for SQLite](https://sqlitebrowser.org/)
* Installs tree from Homebrew
* Installs the [GitHub CLI](https://cli.github.com/)

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
