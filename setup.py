import os
import shlex
import subprocess


def main():
    HOME = os.environ["HOME"]
    DOTFILES = os.path.dirname(os.path.abspath(__file__))

    # --- HOMEBREW --- 
    # Check if Homebrew is installed 
    homebrew_path = os.path.isdir("/opt/homebrew")
    if homebrew_path:
        print("Homebrew already installed")
    else: 
        # Install homebrew
        os.system('/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"')

        # Create symlink to .zprofile
        os.system(f"ln -s {DOTFILES}/zprofile {HOME}/.zprofile")
        # Update $PATH
        os.system("eval '$(/opt/homebrew/bin/brew shellenv)'")


    # Run the rest of the setup functions
    install_homebrew_packages()
    # macos_config replaces the dock plist, so defaults must be applied after it
    macos_config(HOME)
    macos_defaults()
    create_symlinks(HOME, DOTFILES)


def install_homebrew_packages():
    """ Installs all homebrew packages """

    print("\n‼️  Installing homebrew packages\n")
    # The first element is the name of the package
    # The second element is the brew command
    INSTALL_PACKAGES = [
        # 1Password
        ("1Password", "brew install --cask 1password"),

        # iTerm2
        ("iTerm2", "brew install --cask iterm2"),

        # Git (newer than the version bundled with macOS)
        ("Git", "brew install git"),

        # tree
        ("Tree", "brew install tree"),

        # htop
        ("htop", "brew install htop"),

        # Neovim
        ("Neovim", "brew install neovim"),

        # Brew's Python3 package
        ("Python3", "brew install python3"),

        # Ghostty terminal
        ("ghostty", "brew install --cask ghostty"),

        # Spotify
        ("Spotify", "brew install --cask spotify"),

        # DB Browser for SQLite
        ("DB Browser for SQLite", "brew install db-browser-for-sqlite --cask"),
    ]

    for package in INSTALL_PACKAGES:
        try:
            print(f"Installing {package[0]}\n")
            os.system(package[1])
        except:
            print(f"🚨 Failed to install {package[0]}\n")


def macos_config(HOME: str):
    """ Configure all macOS settings and create directories """

    user_plist_path = os.path.join(HOME, "library", "Preferences")

    # Create directory for Git repos 
    os.system(f"mkdir {HOME}/Developer")

    # Replace stock dock plist
    dock_plist_path = "macos_plists/com.apple.dock.plist"
    os.system(f"cp {dock_plist_path} {user_plist_path}")
    os.system("killall Dock")

    # Set git identity
    os.system('git config --global user.name "Andrew Miotke"')
    os.system('git config --global user.email "andrew@andrewmiotke.com"')
    print("Git identity set")

    # Set neovim as the default git editor
    os.system("git config --global core.editor nvim")
    print("Neovim set as git editor")


def create_symlinks(HOME: str, DOTFILES: str):
    """ Create symlinks """

    # --- ZSH ---
    # Remove default zshrc file
    os.system(f"rm {HOME}/.zshrc")
    # Create symlink for zshrc
    os.system(f"ln -s {DOTFILES}/zshrc {HOME}/.zshrc")

    os.system(f"mkdir -p {HOME}/.config")

    # --- NEOVIM ---
    os.system(f"ln -s {DOTFILES}/nvim {HOME}/.config/nvim")

    # --- GHOSTTY -- 
    os.system(f"ln -s {DOTFILES}/ghostty {HOME}/.config/ghostty")

    # --- TMUX ---
    os.system(f"ln -s {DOTFILES}/tmux.conf {HOME}/.tmux.conf")

    # --- CLAUDE CODE ---
    # Only the memory file and skills are symlinked; the rest of ~/.claude is local state.
    # Skills are linked individually since ~/.claude/skills may already hold synced skills.
    os.system(f"mkdir -p {HOME}/.claude/skills")
    os.system(f"ln -s {DOTFILES}/claude/CLAUDE.md {HOME}/.claude/CLAUDE.md")
    for skill in os.listdir(f"{DOTFILES}/claude/skills"):
        os.system(f"ln -s {DOTFILES}/claude/skills/{skill} {HOME}/.claude/skills/{skill}")


def macos_defaults():
    """ Apply macOS `defaults` settings """

    print("\n‼️  Applying macOS defaults\n")
    DEFAULTS = [
        # Set dock size
        ("Setting dock size", "defaults write com.apple.dock tilesize -int 19"),
    ]

    for default in DEFAULTS:
        print(f"{default[0]}\n")
        subprocess.run(shlex.split(default[1]))

    # Restart the Dock so it picks up the new settings
    os.system("killall Dock")


if __name__ == "__main__":
    main()

