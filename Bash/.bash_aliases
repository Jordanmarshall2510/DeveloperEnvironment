#!/usr/bin/bash

# Navigation shortcuts
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ll='ls -la'
alias l='ls -CF'

# System shortcuts
alias update='sudo apt update -y && sudo apt upgrade -y && sudo apt autoremove -y'
alias ports='netstat -tulanp'
alias mem='free -h'
alias disk='df -h'

# Git shortcuts
alias gs='git status'
alias ga='git add -u .'
alias gc='git commit'
alias gca='git commit --amend --no-edit'
alias gr='git restore .'
alias grh='git reset HEAD'
alias gp='git push origin HEAD'
alias gpa='git push HEAD --force-with-lease'
alias gl='git log --oneline'
alias gd='git diff'
alias gb='git branch'
alias gch='git checkout'
alias grh='git rebase HEAD'
alias gpr='git pull --rebase'

# Docker shortcuts
alias d='docker'
alias dc='docker-compose'
alias dps='docker ps'
alias di='docker images'
alias dex='docker exec -it'
alias dprune='docker system prune -af'

# File operations
alias mkdir='mkdir -pv'
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias h='history | grep'
alias f='find . -name'

# System monitoring
alias cpuinfo='cat /proc/cpuinfo'
alias watch-cpu='watch -n 1 "ps aux | sort -nr -k 3 | head -10"'
alias watch-mem='watch -n 1 "ps aux | sort -nr -k 4 | head -10"'
alias tree='tree --dirsfirst -F'
