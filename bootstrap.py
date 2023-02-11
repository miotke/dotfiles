# The intention of this script is to set up and configure a new user environment.
# Using Homebrew it will run through the INSTALL_PACKAGES list the generate symlinks
# for any configuration file that are used. Symlinks include the zshrc file and my entire
# Neovim configuration. Once everything is complete use the vim-plug command (:PlugInstall) to
# install all Neovim plugins.
#
# WARNING: This script is intended to be used on a Mac. Tested on macOS 10.14+

import os

# Installs Homebrew and various packages
INSTALL_PACKAGES = [
    # Install Homebrew
    '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"',
    # Install MonitorControl
    "brew install --cask monitorcontrol",
    # Install DB Browser for SQLite
    "brew install db-browser-for-sqlite --cask",
    # Install tree
    "brew install tree",
    # Install the GitHub CLI tools
    "brew install gh",
    # Install htop
    "brew install htop",
    # Install vim-plug for Neovim
    "curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    # Install Neovim
    "brew install neovim"
    # Install oh-my-zsh
    'sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"',
    # Install VS Code
    'brew install --cask visual-studio-code'
]

SYMLINK_FILES = ["zshrc"]
HOME = os.environ["HOME"]


def install_from_homebrew():
    for command in INSTALL_PACKAGES:
        try:
            print(f"Installing {command}")
            os.system(command)
        except:
            print(f"Failed to install {command}")


def create_directories():
    # Creates a directory for all Git repos
    os.system(f"mkdir {HOME}/Developer")


def setup_commands():
    # Enables build times in Xcode. This might not be needed in Xcode 13
    show_xcode_build_times = ("defaults write com.apple.dt.Xcode ShowBuildOperationDuration YES")
    os.system(show_xcode_build_times)

    # Changes the default git editor to Neovim
    os.system("git config --global core.editor nvim")


def create_symlinks():
    # Creates symlinks for for all files in the SYMLINK_FILES list.
    # This is only a one item list since the vimrc file is no longer being used.
    # If more individual files need symlinks, add them to the SYMLINK_FILES list.
    for file in SYMLINK_FILES:
        print(f"Creating sym links for {file}")
        os.system(f"ln -s {HOME}/dotfiles/{file} {HOME}/.{file}")

    # Creates a symlink for the nvim folder which contains all Neovim config files
    os.system(f"ln -s {HOME}/dotfiles/nvim {HOME}/.config")

def setup_helix(): 
    # Creates a symlink for the helix directory in ~/.config
    print(f"Creating symlink for the helix editor")
    os.system(f"ln -s {HOME}/dotfiles/helix {HOME}/.config")

def vs_code_settings():
    path = "/Applications/Visual Studio Code.app"
    app = os.path.isdir(path)

    if app == True:
        try:
            # Creates symlinks for VSCode preferences
            os.system("ln -s {HOME}/dotfiles/settings.json {HOME}/Library/Application\ Support/Code/User/settings.json")
            os.system("ln -s {HOME}/dotfiles/keybindings.json {HOME}/Library/Application\ Support/Code/User/keybindings.json")

            # Enable key-repeating for the Vim plug-in
            os.system("defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false")
        except:
            print("VS Code needs to be installed or launched first.")
    else:
        try:
            # opens VSCode then creates symlinks
            os.system("open /Applications/Visual\ Studio\ Code.app")
            # Creates symlinks for VSCode preferences
            os.system("ln -s {HOME}/dotfiles/settings.json {HOME}/Library/Application\ Support/Code/User/settings.json")
            os.system("ln -s {HOME}/dotfiles/keybindings.json {HOME}/Library/Application\ Support/Code/User/keybindings.json")
        except:
            print("VS Code needs to be installed or launched first.")


if __name__ == "__main__":
    install_from_homebrew()
    create_directories()
    setup_commands()
    create_symlinks()
    vs_code_settings()
