#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Get the current script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Function to ask a yes/no question with a custom prompt
ask_yn() {
    while true; do
        read -p "$1 (y/n): " yn
        case $yn in
            [Yy]* ) return 0;;  # Return 0 (success) for yes
            [Nn]* ) return 1;;  # Return 1 (failure) for no
            * ) echo "Please answer y or n.";;
        esac
    done
}

# Enable multilib if not already enabled
if ! grep -q '^\[multilib\]' /etc/pacman.conf; then
    echo "Enabling multilib repository..."
    echo -e "\n[multilib]\nInclude = /etc/pacman.d/mirrorlist" | sudo tee -a /etc/pacman.conf > /dev/null
    sudo pacman -Syu
else
    echo "Multilib repository is already enabled."
    sleep 2
    clear
fi

# Function to install yay or paru
install_aur_helper() {
    local aur_helper=$1
    local aur_url=$2
    local aur_dir=$3

    if ! pacman -Q "$aur_helper" &>/dev/null; then
        echo "$aur_helper not detected, proceeding with install script..."
        if ask_yn "Do you want to install $aur_helper (AUR helper)?"; then
            echo "Installing $aur_helper..."
            sudo pacman -Syu --needed base-devel git
            git clone "$aur_url" "$aur_dir"
            (cd "$aur_dir" && makepkg -si)
            rm -rf "$aur_dir"
        else
            echo "Skipping $aur_helper installation..."
            sleep 2
        fi
    else
        echo "$aur_helper detected, skipping installation..."
        sleep 2
    fi
}

# Install yay
install_aur_helper "yay" "https://aur.archlinux.org/yay.git" "~/yay"

# Install paru (if yay is already installed)
if pacman -Q yay &>/dev/null; then
    install_aur_helper "paru" "https://aur.archlinux.org/paru.git" "~/paru"
fi

# Oh My Zsh
echo ""
if ask_yn "Do you want to install Oh My Zsh?"; then
    if [ -d "$HOME/.oh-my-zsh" ]; then
        echo "Oh My Zsh is already installed."
    else
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    fi
else
    echo "Skipping Oh My Zsh installation..."
    sleep 2
    clear
fi

# Copy configuration files
echo ""
echo "Copying configuration files..."
sleep 1

# Create backup of existing configurations
BACKUP_DIR="$HOME/backup_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$BACKUP_DIR"

copy_with_backup() {
    local src=$1
    local dest=$2
    if [ -e "$dest" ]; then
        echo "Backing up existing $(basename "$dest") to $BACKUP_DIR"
        mv "$dest" "$BACKUP_DIR"
    fi
    cp -rf "$src" "$dest"
}

# Backing up and copying config files
echo "Backing up existing configurations to $BACKUP_DIR"
copy_with_backup "$SCRIPT_DIR/.config/" "$HOME/.config/"
copy_with_backup "$SCRIPT_DIR/.zshrc" "$HOME/.zshrc"
copy_with_backup "$SCRIPT_DIR/wallpaper" "$HOME/wallpaper"
copy_with_backup "$SCRIPT_DIR/.themes/" "$HOME/.themes/"

# Install Nerd Fonts
echo ""
if ask_yn "Do you want to install Nerd Fonts (Recommended)?"; then
    git clone --depth=1 https://github.com/ryanoasis/nerd-fonts.git ~/nerd-fonts
    ~/nerd-fonts/install.sh
    rm -rf ~/nerd-fonts
else
    echo "Skipping Nerd Fonts installation..."
    sleep 2
    clear
fi

echo ""
echo "Ready in 3..."
sleep 1
echo "2"
sleep 1
echo "1"
sleep 1
echo "<3"
