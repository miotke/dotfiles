# dotfiles

🙅‍♂️ This is now a private repo 🙅‍♂️

💻 This repo holds my dotfiles and other preference files. Mostly for macOS. 💻

### Install Instructions

Run `./bootstrap.py`

Running bootstrap.py does the following the things:
* Installs [Homebrew](https://brew.sh) as a macOS package manager
* Installs [oh-my-zsh](https://ohmyz.sh) for zsh configuration management
* Installs Vim from Homebrew
* Clones down this [dotfile](https://github.com/miotke/dotfiles) repo from GitHub

### Old Install Instructions(depricated)

* Install oh-my-zsh

	`sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`

* Install vim

	`brew install vim`

* Clone repo

	`https://github.com/miotke/dotfiles.git ~/dotfiles`

* Run `makesymlinks.sh`

	`cd ~/dotfiles; ./makesymlinks.sh`

### Other Files
This repo also contains other configuration files and preferences

* iTerm2 Settings

	* Ensure the following checkbox is checked: _Load preferences from a custom folder or URL:_
	* Point to the `~/dotfiles/iterm2-settings` folder

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
