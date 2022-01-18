#
# ~/.bashrc
#

_checkexec() {
 command -v "$1" > /dev/null
}


# Description
# ===========
#
# BASH configuration file.  Any modules such as the `dircolors` config
# are stored in ~/.local/share/my_bash/.  This setup is part of my
# dotfiles.  See https://gitlab.com/protesilaos/dotfiles.
#
# Note that ALL MY SCRIPTS are designed to work with `#!/bin/bash`.
# They are not tested for portability.
#
# Last full review on 2019-06-28


# General settings
# ================

# Include my scripts in the PATH.
if [ -d "$HOME"/bin ]; then
    PATH=$PATH:"$HOME"/bin
fi

if [ -d "$HOME"/.local/bin ]; then
    PATH=$PATH:"$HOME"/.local/bin
fi

# Default pager.  Note that the option I pass to it will quit once you
# try to scroll past the end of the file.
export PAGER="less --quit-at-eof"
export MANPAGER="$PAGER"

# Default editor.
if pgrep -x emacs > /dev/null; then
    export VISUAL="emacsclient -c"
	export EDITOR="emacsclient -t"
elif _checkexec gvim; then
	export VISUAL="gvim"
	export EDITOR=vim
else
	export VISUAL=vim
	export EDITOR=$VISUAL
fi

# Simple prompt
if [ -n "$SSH_CONNECTION" ]; then
	export PS1="\u@\h: \w \$ "
else
	export PS1="\w \$ "
fi
export PS2="> "

# The following is taken from the .bashrc shipped with Debian 9.  Enable
# programmable completion features (you don't need to enable this, if
# it's already enabled in /etc/bash.bashrc and /etc/profile sources
# /etc/bash.bashrc).
if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
	. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
	fi
fi

# Enable tab completion when starting a command with 'sudo'
[ "$PS1" ] && complete -cf sudo

# If not running interactively, don't do anything.  This too is taken
# from Debian 9's bashrc.
case $- in
	*i*) ;;
	  *) return;;
esac

# Don't put duplicate lines or lines starting with space in the history.
# See `man bash` for more options.
HISTCONTROL=ignoreboth

# Append to the history file, don't overwrite it.
shopt -s histappend

# For setting history length see HISTSIZE and HISTFILESIZE in `man bash`.
HISTSIZE=1000
HISTFILESIZE=2000

# Check the window size after each command and, if necessary, update the
# values of LINES and COLUMNS.
shopt -s checkwinsize


# Common tasks and utilities
# --------------------------

# Check these because some of them modify the behaviour of standard
# commands, such as `cp`, `mv`, `rm`, so that they provide verbose
# output and open a prompt when an existing file is affected.
#
# PRO TIP to ignore aliases, start them with a backslash \.  The
# original command will be used.  This is useful when the original
# command and the alias have the same name.  Example is my `cp` which is
# aliased to `cp -iv`:
#
#	cp == cp -iv
#	\cp == cp

# _Entering_ Vim is easy.
if _checkexec vim; then
    alias v='vim'
    alias vi='vim'
fi


# Extra tasks and infrequently used tools
# ---------------------------------------

# When I need to copy the contents of a file to the clipboard
if _checkexec xclip; then
	alias xclipc='xclip -selection clipboard' # followed by path to file
fi

# I only ever use Stow to make symlinks with my home dir as the base
if _checkexec stow; then
    alias stow="stow -t $HOME"
fi

# Functions
# =========

# Colourise man pages
man() {
	env \
	LESS_TERMCAP_mb=$(tput bold; tput setaf 6) \
	LESS_TERMCAP_md=$(tput bold; tput setaf 6) \
	LESS_TERMCAP_me=$(tput sgr0) \
	LESS_TERMCAP_se=$(tput rmso; tput sgr0) \
	LESS_TERMCAP_ue=$(tput rmul; tput sgr0) \
	LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 4) \
	LESS_TERMCAP_mr=$(tput rev) \
	LESS_TERMCAP_mh=$(tput dim) \
	LESS_TERMCAP_ZN=$(tput ssubm) \
	LESS_TERMCAP_ZV=$(tput rsubm) \
	LESS_TERMCAP_ZO=$(tput ssupm) \
	LESS_TERMCAP_ZW=$(tput rsupm) \
		man "$@"
}

# Enter directory and list contents
cd() {
	if [ -n "$1" ]; then
		builtin cd "$@" && ls -pvA --color=auto --group-directories-first
	else
		builtin cd ~ && ls -pvA --color=auto --group-directories-first
	fi
}

# Back up a file. Usage "backupthis <filename>"
backupthis() {
	cp -riv $1 ${1}-$(date +%Y%m%d%H%M).backup;
}

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
