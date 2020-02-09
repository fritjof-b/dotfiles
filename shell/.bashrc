#!/bin/bash

# get bash aliases
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# Enter directory and list contents
function cd() {
 if [ -n "$1" ]; then
  builtin cd "$@" && ls -pvA --color=auto --group-directories-first
 else
  builtin cd ~ && ls -pvA --color=auto --group-directories-first
 fi
}


# Simple prompt
if [ -n "$SSH_CONNECTION" ]; then
 export PS1="\u@\h: \w \$ "
else
 export PS1="\w \$ "
fi
export PS2="> "

# Enable tab completion when starting a command with 'sudo'
[ "$PS1" ] && complete -cf sudo


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

