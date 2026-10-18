package main

import (
	"fmt"
	"os"
	"os/exec"
	"path/filepath"
	"errors"
	"net/http"
	"io"
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
		app     string
		command string 
	}

	installPackages := []pkg{ 
		{"1Passworld", "brew install --cask 1Password"},
		{"iTerm2", "brew install --cask iterm2"}, 
		{"Spotify", "brew install --cask spotify"},
		{"Git", "brew install git"},
		{"Tree", "brew install tree"},
		{"htp", "brew install htop"},
		{"Neovim", "brew install neovim"},
	}

	for i := range len(installPackages) { 
		fmt.Println("Installing %v", pkg.app)
		// cmd := exec.Command(pkg.command)
	}


}

func getHomeDir() string { 
	home, err := os.UserHomeDir()
	if err != nil { fmt.Println("Failed to get home path") }
	return home
}

// Helper functions 
func check(e error) { 
	if e != nil { 
		panic(e)
	}
}

func fileExists (path string) bool { 
	// Helper function to check if file exists
	_, err := os.Stat(path)
	return !errors.Is(err, os.ErrNotExist)
}
