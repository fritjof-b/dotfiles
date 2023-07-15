#!/bin/bash

GREEN='\033[0;32m'
NC='\033[0m'
CHECK_MARK="${GREEN}✔${NC}"

echo -n "Creating directories..."
mkdir -p "$HOME"/{tmp,bin,dev}
mkdir -p "$HOME"/tmp/screenshots
echo -e " ${CHECK_MARK}"

echo -n "Setting screenshots directory..."
defaults write com.apple.screencapture location "$HOME/tmp/screenshots" && killall SystemUIServer
echo -e " ${CHECK_MARK}"

echo -n "Setting up dock..."
defaults write com.apple.dock orientation left
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
killall Dock
echo -e " ${CHECK_MARK}"

echo -n "Setting up finder..."
defaults write com.apple.finder AppleShowAllFiles YES
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
killall Finder