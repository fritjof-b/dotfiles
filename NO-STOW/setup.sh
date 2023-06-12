#!/bin/bash

# This script is used to streamline the setup of a new machine.
# It installs all the necessary packages and sets up the dotfiles.
OH_MY_ZSH_URL="https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh"
BREW_URL="https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh"

function error_exit {
  echo "Error on line ${1}: ${2}" 1>&2
  exit 1
}

if ! command -v curl &> /dev/null; then
  error_exit ${LINENO} "Curl is not installed"
fi

if ! command -v brew &> /dev/null; then
    echo "Brew is not installed. Installing brew..."
    /bin/bash -c "$(curl -fsSL $BREW_URL)"
    export PATH="/opt/homebrew/bin:$PATH"
    if ! command -v brew &> /dev/null; then
        error_exit ${LINENO} "Failed to install brew"
    fi
else
    echo "Brew is installed. Updating brew..."
    brew update
fi

sh -c "$(curl -fsSL $OH_MY_ZSH_URL)"
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
    error_exit ${LINENO} "Failed to install oh-my-zsh"
fi


export HOMEBREW_BUNDLE_FILE="$HOME/dotfiles/NO-STOW/brew/Brewfile"
echo "Installing brew packages..."
brew bundle --cleanup -v
if [[ $? -ne 0 ]]; then
    error_exit ${LINENO} "Failed to install brew packages"
fi

for dir in "$HOME"/dotfiles/*/; do
    if [[ $dir != "$HOME/dotfiles/NO-STOW/" ]]; then
        stow -v -t "$HOME" -d "$HOME"/dotfiles "$(basename "$dir")"
    fi
done

# dir setup
mkdir -pv "$HOME"/{tmp,bin,dev}
mkdir -pv "$HOME"/tmp/screenshots

# macos defaults
defaults write com.apple.screencapture location "$HOME/tmp/screenshots"
killall SystemUIServer
defaults write com.apple.dock orientation left
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
killall Dock
