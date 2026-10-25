package main

import (
	"errors"
	"fmt"
	"io"
	"net/http"
	"os"
	"os/exec"
	"path/filepath"
	"strings"
)

func main() {
	// Get home dir path
	home := getHomeDir()

	// Create `code` path
	createCodeDirectory(home)

	// Create and define dotfiles path
	// to clone repo into
	dotfilesPath := getDotfilesPath(home)

	// Clone dotfiles repo
	cloneDotfilesRepo(dotfilesPath)

	// Check if homebrew is installed. Install it of not
	homebrewInstall := fileExists("/opt/homebrew/bin/brew")

	if homebrewInstall {
		fmt.Println("Homebrew installed")
	} else {
		fmt.Println("Couldn't find homebrew. Install homebrew...")
		installHomebrew()
	}

	// install homebrew packages
	installHomebrewPackages()

	// setup Mac config (defaults, dock items)

	// Create symlinks for home and dotfiles

}

func getDotfilesPath(home string) string {
	dotfilesPath := filepath.Join(home, "dotfiles")
	if err := os.MkdirAll(dotfilesPath, 0755); err != nil {
		fmt.Print("Failed to create dotfiles directory: ", err)
	}
	return dotfilesPath
}

func cloneDotfilesRepo(dotfilesPath string) {
	resp, err := http.Get("https://github.com/miotke/dotfiles.git")
	check(err)
	defer resp.Body.Close()
}

func createCodeDirectory(home string) string {
	path := home + "/code"
	err := os.MkdirAll(path, 0755)
	check(err)
	return path
}

func installHomebrew() {
	resp, err := http.Get("https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh")
	check(err)
	defer resp.Body.Close()

	homebrewScript, err := io.ReadAll(resp.Body)
	check(err)
	cmd := exec.Command("/bin/bash", "-c", string(homebrewScript))
	cmd.Stdin = os.Stdin
	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr
	cmd.Run()
	check(err)

	exec.Command("echo", ">>", "~/.zprofile").Run()
	exec.Command("echo", `'eval "$(/opt/homebrew/bin/brew shellenv zsh)"'`, ">>", "~/.zprofile").Run()
	exec.Command("eval", "'$(/opt/homebrew/bin/brew shellenv zsh)'").Run()
}

func installHomebrewPackages() {
	type pkg struct {
		appName string
		cask    bool
	}

	brewPackages := []pkg{
		{"1password", true},
		{"iterm2", true},
		{"spotify", true},
		{"git", false},
		{"Tree", false},
		{"htop", false},
		{"Neovim", false},
	}

	for _, p := range brewPackages {
		if p.cask {
			cmd := exec.Command("brew", "install", "--cask", p.appName)
			cmd.Stdin = os.Stdin
			cmd.Stdout = os.Stdout
			cmd.Stderr = os.Stderr
			cmd.Run()
		} else {
			cmd := exec.Command("brew", "install", p.appName)
			cmd.Stdin = os.Stdin
			cmd.Stdout = os.Stdout
			cmd.Stderr = os.Stderr
			cmd.Run()
		}
	}
}

func macOSDefaults(home string, dotfilesPath string) {
	// Dock configuration
	userPlistPath := filepath.Join(home, "Library", "Preferences")
	macOSPlists := "macos_plists"
	filename := "com.apple.dock.plist"

	dockPlist := filepath.Join(dotfilesPath, macOSPlists, filename)
	cmd := exec.Command("cp", dockPlist, userPlistPath)
	output, err := cmd.Output()

	exec.Command("killall", "Dock").Output()

	check(err)
	fmt.Println(string(output))

	// Set git config
	setGitIdentity, err := gitConfig()
	fmt.Println(setGitIdentity)
	check(err)
}

func gitConfig() (string, error) {

	exec.Command("git", "config", "--global", "user.name", "Andrew Miotke").Output()
	exec.Command("git", "config", "--global", "user.email", "andrew@andrewmiotke.com").Output()
	exec.Command("git", "config", "--global", "core.editor", "nvim").Output()

	gitEditor, err := exec.Command("git", "config", "get", "core.editor").Output()
	if err != nil {
		return "", err
	}

	if strings.TrimSpace(string(gitEditor)) == "nvim" {
		fmt.Println("git editor == nvim")
	} else {
		return "", errors.New("Failed to set git editor to nvim")
	}

	return "git config set", nil
}
