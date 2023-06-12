eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(pyenv init -)"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# local/sbin
if [ -d "/usr/local/sbin" ]; then 
	PATH="/usr/local/sbin:$PATH"
fi

if [ -d "/opt/homebrew/" ]; then
	PATH="/opt/homebrew/bin:$PATH"
fi


