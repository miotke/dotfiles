package main

import (
	"errors"
	"fmt"
	"io"
	"net/http"
	"os"
	"os/exec"
	"path/filepath"
)

func main() {
	// Get home dir path
	home := getHomeDir()
	fmt.Println(home)

	// Create and define dotfiles path
	dotfilesPath := filepath.Join(home, "dotfiles")
	if err := os.MkdirAll(dotfilesPath, 0755); err != nil {
		fmt.Print("Failed to create dotfiles directory: ", err)
	}

	// Create `code` path

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

func getHomeDir() string {
	home, err := os.UserHomeDir()
	if err != nil {
		fmt.Println("Failed to get home path")
	}
	return home
}

// Helper functions
func check(e error) {
	if e != nil {
		panic(e)
	}
}

func fileExists(path string) bool {
	// Helper function to check if file exists
	_, err := os.Stat(path)
	return !errors.Is(err, os.ErrNotExist)
}
