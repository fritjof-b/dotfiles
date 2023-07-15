OH_MY_ZSH_URL="https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh"


if [[ -d $HOME/.oh-my-zsh ]]; then
    echo "oh-my-zsh already installed"
    exit 0
fi

echo -n "Installing oh-my-zsh..."
sh -c "$(curl -fsSL $OH_MY_ZSH_URL)"
