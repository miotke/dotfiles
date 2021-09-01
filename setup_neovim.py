# Sets up the Neovim configuration

import os


def main():
    HOME = os.environ['HOME']

    os.system(f"mkdir {HOME}/.config/nvim/")
    os.system(f"mkdir {HOME}/.config/nvim/colors/")


if __name__ == "__main__":
    main()
