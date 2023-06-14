#!/bin/bash

# This script is used to streamline the setup of a new machine.
# It installs all the necessary packages and sets up the dotfiles.
OH_MY_ZSH_URL="https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh"
BREW_URL="https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh"
POETRY_URL="https://install.python-poetry.org/"

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'
CHECK_MARK="${GREEN}✔${NC}"
CROSS="${RED}✖${NC}"

function error_exit {
  echo -e "$CROSS Error on line ${1}: ${2}" 1>&2
  exit 1
}

echo -n "Checking if curl is installed..."
if ! command -v curl &> /dev/null; then
  error_exit ${LINENO} "Curl is not installed"
fi
echo -e " ${CHECK_MARK}"

echo "Checking if brew is installed..."
if ! command -v brew &> /dev/null; then
    echo "Brew is not installed. Installing brew..."
    /bin/bash -c "$(curl -fsSL $BREW_URL)"
    export PATH="/opt/homebrew/bin:$PATH"
    if ! command -v brew &> /dev/null; then
        error_exit ${LINENO} "Failed to install brew"
    fi
else
    echo "Brew is installed. Updating brew..."
    brew update &> /dev/null
fi

echo -n "Installing oh-my-zsh..."
#sh -c "$(curl -fsSL $OH_MY_ZSH_URL)"
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
    error_exit ${LINENO} "Failed to install oh-my-zsh"
fi
echo -e " ${CHECK_MARK}"


export HOMEBREW_BUNDLE_FILE="$HOME/dotfiles/NO-STOW/brew/Brewfile"
echo -n "Installing brew packages..."
brew bundle --cleanup &> /dev/null
if [[ $? -ne 0 ]]; then
    error_exit ${LINENO} "Failed to install brew packages"
fi
echo -e " ${CHECK_MARK}"

echo -n "Creating symlinks..."
for dir in "$HOME"/dotfiles/*/; do
    if [[ $dir != "$HOME/dotfiles/NO-STOW/" ]]; then
        stow -v -t "$HOME" -d "$HOME"/dotfiles "$(basename "$dir")"
    fi
done
echo -e " ${CHECK_MARK}"

echo -n "Installing poetry..."
#curl -sSL "${POETRY_URL}" | python3 -
if ! command -v poetry &> /dev/null; then
    error_exit ${LINENO} "Failed to install poetry"
fi
echo -e " ${CHECK_MARK}"

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
echo -e " ${CHECK_MARK}"


echo "All done! 🎉"