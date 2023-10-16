import os
import time

def main():
    HOME = os.environ["HOME"]
    DOTFILES = os.path.join(HOME, "developer", "dotfiles")

    create_directories(HOME)

    # Install homebrew
    os.system('/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"')
    print("Homebrew installed")

    install_homebrew_packages()
    create_symlinks(HOME, DOTFILES)
    configure_vs_codium(HOME, DOTFILES)
    install_optional_homebrew_packages()

    # Set Neovim as git editor
    os.system("git config --global core.editor nvim")
    print("Neovim set as git editor")


def install_homebrew_packages():
    INSTALL_PACKAGES = [
         # Install oh-my-zsh
        ("oh-my-zsh", 'sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"'),
        # Install tree
        ("Tree", "brew install tree"),
        # Install htop
        ("htop", "brew install htop"),
        # Install vim-plug for Neovim
        ("vim-plug", "curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"),
        # Install Neovim
        ("Neovim", "brew install neovim"),
        # Install VSCodium
        ("VSCodium", "brew install --cask vscodium"),
        # Install RapidAPI
        ("RapidAPI", "brew install --cask rapidapi"),
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

    for file in SYMLINK_FILES:
        print(f"Creating symlink for {file}")
        os.system(f"ln -s {DOTFILES}/nvim {HOME}/.config")


def configure_vs_codium(HOME: str, DOTFILES: str):
    path = "/Applications/VSCodium.app"
    check_for_vscodium = os.path.isdir(path)

    if check_for_vscodium == True:
        try:
            # Launch VSCodium before configuring settings and wait 3 seconds
            os.system("open /Applications/VSCodium.app")
            time.sleep(3)

            # Create symlinks for VSCodium Settings
            os.system("ln -s {DOTFILES}/settings.json {HOME}/Library/Application\ Support/VSCodium/User/settings.json")
            # Create symlinks for VSCodium Keybindings
            os.system("ln -s {DOTFILES}/keybindings.json {HOME}/Library/Application\ Support/VSCodium/User/keybindings.json")

            # Enable key-repeating for the neovim plug-in
            os.system("defaults write -app VSCodium ApplePressAndHoldEnabled -bool false")
        except:
            print("VSCodium can not be found. Make sure it's installed.")


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
