import os
import time

def main():
    HOME = os.environ["HOME"]
    DOTFILES = os.path.join(HOME, "developer", "dotfiles")

    create_directories(HOME)

    # Check if homebrew is installed
    check_for_homebrew = os.system("which brew")
    if check_for_homebrew != "":
        pass
    else:
        # Install homebrew
        os.system('/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"')
        print("Homebrew installed")

    install_homebrew_packages()
    create_symlinks(HOME, DOTFILES)
    install_optional_homebrew_packages()

    # Set Neovim as git editor
    os.system("git config --global core.editor nvim")
    print("Neovim set as git editor")


def install_homebrew_packages():
    # The first element is the name of the package
    # The second element is the brew command
    INSTALL_PACKAGES = [
         # Install oh-my-zsh
        ("oh-my-zsh", 'sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"'),
        # Install tree
        ("Tree", "brew install tree"),
        # Install htop
        ("htop", "brew install htop"),
        # Install Neovim
        ("Neovim", "brew install neovim"),
        # Install RapidAPI
        ("RapidAPI", "brew install --cask rapidapi"),
        # Install nerd fonts
        ("cask-fonts", "brew tap homebrew/cask-fonts"),
        ("font-hack-nerd-fonts", "brew install font-hack-nerd-font"),
        # Install Brew's Python3 package
        ("Python3", "brew install python3"),
    ]

    for package in INSTALL_PACKAGES:
        try:
            print(f"Installing {package[0]}")
            os.system(package[1])
        except:
            print(f"Failed to install {package[0]}")


def create_directories(HOME: str):
    # Create directory for Git repos
    os.system(f"mkdir {HOME}/Developer")


def create_symlinks(HOME: str, DOTFILES: str):
    SYMLINK_FILES = ["zshrc"]

    # Creates a symlink for the nvim folder which contains all Neovim config files
    os.system(f"ln -s {DOTFILES}/nvim {HOME}/.config")

    try:
        # Remove created zshrc file
        os.system(f"rm {HOME}/.zshrc")
        # Create symlink for zshrc
        os.system(f"ln -s {DOTFILES}/zshrc {HOME}/.zshrc")
    except: 
        print("Failed to delete zshrc file")


def install_optional_homebrew_packages():
    PACKAGES = [
        # Install DB Browser for SQLite
        ("DB Browser for SQLite", "brew install db-browser-for-sqlite --cask"),
    ]

    install_package = False

    # If install_package is True install the package using
    # otherwise skip and move to the next package in the list.
    for package in PACKAGES:
        install_package_prompt = input(f"Install {package[0]} y/n? ")
        if install_package:
            os.system(package[1])


if __name__ == "__main__":
    main()

