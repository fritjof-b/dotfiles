FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
export ZSH="$HOME/.oh-my-zsh"
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

export ZDOTDIR="$HOME/.zdot"
export HISTFILE="$ZDOTDIR/.zsh_history"
export ZSHZ_DATA="$ZDOTDIR/.z"

export PAGER="less --quit-at-eof"
export MANPAGER="$PAGER"
export LESSHISTFILE=-

ZSH_THEME="robbyrussell"
HISTCONTROL=ignoreboth

zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' frequency 13


plugins=(
	macos
	sudo
	z
	colored-man-pages
	poetry
)

source $ZSH/oh-my-zsh.sh
source $HOME/.zsh_aliases


chpwd() {
	gls -F --group-directories-first --color=auto
}

function backupthis() {
	cp -riv $1 ${1}-$(date +%Y%m%d%H%M).backup;
}
