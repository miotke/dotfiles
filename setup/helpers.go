package main

import (
	"errors"
	"fmt"
	"os"
)

func getHomeDir() string {
	home, err := os.UserHomeDir()
	if err != nil {
		fmt.Println("Failed to get home path")
	}
	return home
}

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
