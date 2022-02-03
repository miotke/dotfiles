# Sets up the Neovim configuration

import os


def main():
    HOME = os.environ['HOME']
    
    # Install vim-plug
    os.system("curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim")

    # Removes the nvim folder that vim-plug creates in .config
    os.system(f"rm -r {HOME}/.config/nvim")
    
    # Symlink dotfiles/nvim to the .config folder.
    os.system(f"ln -s {HOME}/dotfiles/nvim {HOME}/.config")

    # Change the git text editor to neovim
    os.system("git config --global core.editor nvim")


if __name__ == "__main__":
    main()

