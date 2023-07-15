echo -n "Creating symlinks..."
for dir in "$HOME"/dotfiles/*/; do
    if [[ $dir != "$HOME/dotfiles/NO-STOW/" ]]; then
        stow -v -t "$HOME" -d "$HOME"/dotfiles "$(basename "$dir")"
    fi
done