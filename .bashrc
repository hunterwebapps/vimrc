alias ls='ls -al'
alias vimrc='vim ~/.vimrc'
alias eject='bash ~/vimrc/eject.sh'
alias cl='clear'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd../../..'

# Git
alias gs="git status"
alias gac="git add . && git commit -m"
alias gaca="git add --all && git commit --amend --no-edit"

# SSH Service for Visual Studio Access
alias vsdebug="sudo service ssh start"

export PS1="[\[$(tput sgr0)\]\[\033[38;5;75m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]] \[$(tput sgr0)\]\[\033[38;5;75m\]>\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

export EDITOR=vim

export DISPLAY=localhost:0.0
export DOTNET_CLI_TELEMETRY_OPTOUT=true

