# My aliases for bash

## System utils
# ls
alias ls='ls -pv --color=auto --group-directories-first'
alias lsa='ls -pvA --color=auto --group-directories-first'
alias lsl='ls -lhpv --color=auto --group-directories-first'
alias lsls='ls -lhpvA --color=auto --group-directories-first'

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

# grep
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# xclip
alias xclip='xclip -selection clipboard'

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

