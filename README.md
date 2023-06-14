# Dotfiles

For my own sanity, I'm keeping my dotfiles in this repo.
I'm using [GNU Stow](https://www.gnu.org/software/stow/) to manage the symlinks.

There are also general steps for setting up a new machine (MacOS).

## Setup

1. Install command line tools: `xcode-select --install`
2. Run `./NO-STOW/setup.sh` to install Homebrew and other tools.

The setup script will install the following tools:
- [Homebrew](https://brew.sh/)
- [Poetry](https://python-poetry.org/)
- Packages specified in `./NO-STOW/Brewfile`
- Some MacOS settings (see below)

### Packages

- [stow](https://www.gnu.org/software/stow/)
- [coreutils](https://www.gnu.org/software/coreutils/)
- [python](https://www.python.org/)
- [pyenv](https://github.com/pyenv/pyenv)
- [bat](https://github.com/sharkdp/bat)
- [tree](http://mama.indstate.edu/users/ice/tree/)
- [vim](https://www.vim.org/)
- [jq](https://stedolan.github.io/jq/)
- [task](https://taskwarrior.org/)

### Casks

- spectacle
- spotify
- visual-studio-code
- docker
- slack
- intellij-idea-ce
- signal

## MacOS

### Settings

Additions to the default settings:

- `Trackpad > Tap to click`
- `Keyboard > Key Repeat > Fast`
- `Keyboard > Delay Until Repeat > Short`
- `Keyboard > Keyboard Shortcuts > Function Keys > Use all F1, F2, etc.`
- `Keyboard > Text > Disable "Correct spelling automatically"`