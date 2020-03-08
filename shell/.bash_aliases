# My aliases for bash

## System utils
# ls
alias ls='ls -A --color=auto --group-directories-first'
alias ll='ls -Al --color=auto --group-directories-first'

# apt
alias as='apt search'
alias ai='sudo apt install'
alias aug='sudo apt update && sudo apt upgrade'
alias ali='apt list -i'
alias ar='sudo apt remove'
alias arr='sudo apt autoremove'

# cd
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# mkdir
alias md='mkdir -pv'

# remove, copy and move
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -Iv'

# GUI
alias open='xdg-open'

## Developer utils
# git
alias gc='git commit -m'
alias gca='git commit -am'
alias gps='git push'
alias gpl='git pull'
alias gft='git fetch'
alias gch='git checkout'
alias gst='git status'
alias gbr='git branch'

