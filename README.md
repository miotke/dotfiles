# dotfiles

💻 This repo holds my dotfiles and other preference files. Mostly for macOS. 💻


### Vundle Plugins
Copy these directly into your `.vimrc` file to install with Vundle
* Plugin 'VundleVim/Vundle.vim'
* Plugin 'scrooloose/nerdtree'
* Plugin 'scrooloose/nerdcommenter'
* Plugin 'godlygeek/tabular'
* Plugin 'phanviet/vim-monokai-pro'
* Plugin 'airblade/vim-gitgutter'
* Plugin 'bling/vim-airline'
* Plugin 'maralla/completor.vim'

### Install Instructions
* Install zsh

	`sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`
	
* Install oh-my-zsh

	`sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`

* Install vim

	`brew install vim`

* Install Vundle

	`git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`

* Clone repo

	`https://github.com/miotke/dotfiles.git ~/dotfiles`

* Run `makesymlinks.sh`

	`cd ~/dotfiles; ./makesymlinks.sh`

* Run `copy_config_files.py`

	`python3 copy_config_files.py`

### Other Files
This repo also contains other configuration files and preferences

* iTerm2 Settings
	
	* Ensure the following checkbox is checked: _Load preferences from a custom folder or URL:_
	* Point to the `~/dotfiles/iterm2-settings` folder 
