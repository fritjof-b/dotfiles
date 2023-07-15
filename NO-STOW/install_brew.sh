#!/bin/bash

BREW_URL="https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh"
HOMEBREW_BUNDLE_FILE="$HOME/dotfiles/NO-STOW/brew/Brewfile"

function error_exit {
  echo -e "Error on line ${1} : ${2}" 1>&2
  exit 1
}

if ! command -v curl &> /dev/null; then
  error_exit ${LINENO} "Curl is not installed..."
fi

if ! command -v brew &> /dev/null; then
  if [[ -d "/opt/homebrew/" ]]; then
    error_exit ${LINENO} "Brew is installed but not in path"
  fi

  echo "Brew is not installed. Installing brew..."
  /bin/bash -c "$(curl -fsSL $BREW_URL)"
  export PATH="/opt/homebrew/bin:$PATH"
  if ! command -v brew &> /dev/null; then
    error_exit ${LINENO} "Failed to install brew."
  fi
fi

brew bundle --cleanup
echo "Brew is set up and packages installed."