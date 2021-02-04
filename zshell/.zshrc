#
# ~/.zshrc
#

export ZSH="/Users/fb/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(
	osx
	sudo
	iterm2
	vscode
	z
	colored-man-pages
)

source $ZSH/oh-my-zsh.sh
source $HOME/.zsh_aliases


# General settings
# ================


# Default pager.  Note that the option I pass to it will quit once you
# try to scroll past the end of the file.
export PAGER="less --quit-at-eof"
export MANPAGER="$PAGER"


# Don't put duplicate lines or lines starting with space in the history.
# See `man bash` for more options.
HISTCONTROL=ignoreboth

# For setting history length see HISTSIZE and HISTFILESIZE in `man bash`.
HISTSIZE=1000
HISTFILESIZE=2000

# Custom functions

chpwd() {
	gls -AF --group-directories-first --color=auto
}

function acp() {
	git add .
	git commit -m "$1"
	git push
}

function backupthis() {
	cp -riv $1 ${1}-$(date +%Y%m%d%H%M).backup;
}

source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/fb/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/fb/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/fb/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/fb/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

