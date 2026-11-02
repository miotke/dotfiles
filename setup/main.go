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
		installHomebrew(home)
	}

	// install homebrew packages
	installHomebrewPackages()

	// setup Mac config (defaults, dock items)
	macOSDefaults(home, dotfilesPath)

	// Create symlinks for home and dotfiles
	createSymlinks(home, dotfilesPath)

}

func getDotfilesPath(home string) string {
	dotfilesPath := filepath.Join(home, "dotfiles")
	if err := os.MkdirAll(dotfilesPath, 0755); err != nil {
		fmt.Print("Failed to create dotfiles directory: ", err)
	}
	return dotfilesPath
}

func cloneDotfilesRepo(dotfilesPath string) {
	repo := "https://github.com/miotke/dotfiles.git"
	cmd := exec.Command("git", "clone", repo, dotfilesPath)
	cmd.Stdout = os.Stdout
	err := cmd.Run()
	check(err)
}

func createCodeDirectory(home string) string {
	path := home + "/code"
	err := os.MkdirAll(path, 0755)
	check(err)
	return path
}

func installHomebrew(home string) {
	resp, err := http.Get("https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh")
	check(err)
	defer resp.Body.Close()

	homebrewScript, err := io.ReadAll(resp.Body)
	check(err)
	cmd := exec.Command("/bin/bash", "-c", string(homebrewScript))
	cmd.Stdin = os.Stdin
	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr
	err = cmd.Run()
	check(err)

	zprofilePath := filepath.Join(home, ".zprofile")

	f, err := os.OpenFile(zprofilePath, os.O_APPEND|os.O_CREATE|os.O_WRONLY, 0644)
	check(err)
	defer f.Close()

	_, err = f.Write([]byte(`eval "$(/opt/homebrew/bin/brew shellenv zsh)"` + "\n"))
	if err != nil {
		fmt.Println("Failed to write to file")
	}

	path := os.Getenv("PATH")
	os.Setenv("HOMEBREW_PREFIX", "/opt/homebrew")
	os.Setenv("PATH", "/opt/homebrew/bin:/opt/homebrew/sbin:"+path)
	fmt.Println("PATH setup correctly for brew")
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
		{"go", false},
		{"git", false},
		{"Neovim", false},
	}

	for _, p := range brewPackages {
		if p.cask {
			cmd := exec.Command("brew", "install", "--cask", p.appName)
			cmd.Stdin = os.Stdin
			cmd.Stdout = os.Stdout
			cmd.Stderr = os.Stderr
			err := cmd.Run()
			check(err)
		} else {
			cmd := exec.Command("brew", "install", p.appName)
			cmd.Stdin = os.Stdin
			cmd.Stdout = os.Stdout
			cmd.Stderr = os.Stderr
			err := cmd.Run()
			check(err)
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

	// TODO: Install gopls for nvim
	// go install golang.org/x/tools/gopls@latest
	cmd = exec.Command("go", "install", "golang.org/x/tools/gopls@latest")
	output, err = cmd.Output()
	cmd.Run()
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
		return "", errors.New("failed to set git editor to nvim")
	}

	return "git config set", nil
}

func createSymlinks(home string, dotfilesPath string) {
	type symlink struct {
		source string
		target string
	}

	symlinks := []symlink{
		{"zshrc", ".zshrc"},
		{"nvim", "nvim"},
		{"tmux.conf", ".tmux.conf"},
	}

	// Check if the zshrc file exists already
	zshrcFileState := checkForExistingZshrc(home)
	fmt.Println(zshrcFileState)

	// Check for ~/.config and if it doesn't exists create it
	err := os.MkdirAll(filepath.Join(home, ".config"), 0755)
	if err != nil {
		fmt.Println(err)
	}
	configDir, err := os.Stat(home + ".config")
	if err != nil {
		fmt.Println("Can't find ~/.config")
	}

	configDirPath := filepath.Join(home, ".config")

	if !configDir.IsDir() {
		exec.Command("mkdir", configDirPath)
	}

	for _, symlink := range symlinks {
		source := filepath.Join(dotfilesPath, symlink.source)
		target := filepath.Join(home, symlink.target)

		if symlink.source == "nvim" {
			target := configDirPath + symlink.target
			exec.Command("ln", "-s", source, target)
		}

		exec.Command("ln", "-s", source, target).Run()
		fmt.Printf("Symlink created for %s", symlink.source)
	}
}

func checkForExistingZshrc(home string) string {
	zshrc := filepath.Join(home, ".zshrc")
	checkForZshrc := fileExists(zshrc)
	result := ""

	if checkForZshrc {
		cmd := exec.Command("rm", zshrc)
		cmd.Run()
		result = "Original zshrc removed successfully"
	} else {
		result = "Unable to remove original zshrc"
	}

	return result
}
