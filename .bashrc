alias ls='ls -al'
alias vimrc='vim ~/.vimrc'
alias eject='bash ~/vimrc/eject.sh'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd../../..'

# Git
alias gs="git status"
alias gac="git add . && git commit -m"
alias gaca="git add --all && git commit --amend --no-edit"

export PS1="[\[$(tput sgr0)\]\[\033[38;5;75m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]] \[$(tput sgr0)\]\[\033[38;5;75m\]>\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

export EDITOR=vim

