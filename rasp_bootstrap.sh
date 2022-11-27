#!/bin/bash

# Used to make configuring a Raspberry Pi easier.

# Check for updates
sudo apt update 

# Install updates
sudo apt upgrade

# Create directory for git repos
mkdir developer

### Install and build the Helix editor ###
# The Helix editor needs to be build from source for RaspberryPi OS.
# https://docs.helix-editor.com/install.html

# Install Rust and Cargo
curl https://sh.rustup.rs -sSf | sh

# Clone Helix to the developer directory
cd HOME/developer
git clone https://github.com/helix-editor/helix

# Build Helix
echo "Building Helix"
cd developer/helix/
cargo install --path helix-term

# Install pip
sudo apt install pip

