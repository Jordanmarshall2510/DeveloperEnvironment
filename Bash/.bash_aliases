#!/usr/bin/bash

#------------------------------------------------------------------------------
# Navigation shortcuts
#------------------------------------------------------------------------------
alias ..='cd ..'                                                                                        # Goes back one directory
alias ...='cd ../..'                                                                                    # Goes back two directories
alias ....='cd ../../..'                                                                                # Goes back three directories
alias ls='ls --color=auto'                                                                              # Enables colored output for ls
alias ll='ls -la'                                                                                       # Long listing format with hidden files
alias l='ls -CF'                                                                                        # Classify files in columns

#------------------------------------------------------------------------------
# System shortcuts
#------------------------------------------------------------------------------
alias update='sudo apt update -y && sudo apt upgrade -y && sudo apt autoremove -y'                      # Update and upgrade the system
alias ports='netstat -tulanp'                                                                           # List all active ports
alias mem='free -h'                                                                                     # Display memory usage in human-readable format
alias disk='df -h'                                                                                      # Display disk usage in human-readable format
alias cls='clear'                                                                                       # Clear the terminal screen
alias reboot='sudo reboot'                                                                              # Safely reboot the system
alias shutdown='sudo shutdown now'                                                                      # Safely shutdown the system

#------------------------------------------------------------------------------
# Git shortcuts
#------------------------------------------------------------------------------
alias gs='git status'                                                                                   # Show working tree status
alias ga='git add -u'                                                                                   # Stage all changes
alias gc='git commit'                                                                                   # Create a new commit
alias gca='git commit --amend --no-edit'                                                                # Amend previous commit without editing
alias gr='git restore .'                                                                                # Discard all local changes
alias grh='git reset HEAD'                                                                              # Unstage changes
alias gp='git push origin HEAD'                                                                         # Push current branch to origin
alias gpa='git push origin HEAD --force-with-lease'                                                     # Force push with safety
alias gcpa='git commit --amend --no-edit && git push origin HEAD --force-with-lease'                    # Amend and force push
alias gacpa='git add -u && git commit --amend --no-edit && git push origin HEAD --force-with-lease'     # Stage, amend, and force push
alias gl='git log --oneline'                                                                            # Show commit logs in one line
alias gd='git diff'                                                                                     # Show changes between commits
alias gb='git branch'                                                                                   # List or manage branches
alias gch='git checkout'                                                                                # Switch branches or restore files
alias grh='git rebase HEAD'                                                                             # Rebase current branch
alias gpr='git pull --rebase'                                                                           # Pull and rebase instead of merge

#------------------------------------------------------------------------------
# Docker shortcuts
#------------------------------------------------------------------------------
alias d='docker'                                                                                        # Docker command shorthand
alias dc='docker-compose'                                                                               # Docker Compose shorthand
alias dps='docker ps'                                                                                   # List containers
alias di='docker images'                                                                                # List images
alias dex='docker exec -it'                                                                             # Enter a running container
alias dprune='docker system prune -af'                                                                  # Remove unused data

#------------------------------------------------------------------------------
# File operations
#------------------------------------------------------------------------------
alias mkdir='mkdir -pv'                                                                                 # Create directories with parents and verbose
alias grep='grep --color=auto'                                                                          # Colorize grep output
alias diff='diff --color=auto'                                                                          # Colorize diff output
alias h='history | grep'                                                                                # Search command history
alias f='find . -name'                                                                                  # Find files by name
alias update-bashrc='vim ~/.bashrc && source ~/.bashrc'                                                 # Edit and reload bashrc

#------------------------------------------------------------------------------
# System monitoring
#------------------------------------------------------------------------------
alias meminfo='free -m -l -t'                                                                           # Display detailed memory information
alias psmem='ps auxf | sort -nr -k 4'                                                                   # List processes by memory usage
alias psmem10='ps auxf | sort -nr -k 4 | head -10'                                                      # Top 10 processes by memory
alias pscpu='ps auxf | sort -nr -k 3'                                                                   # List processes by CPU usage
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'                                                      # Top 10 processes by CPU
alias cpuinfo='lscpu'                                                                                   # Display CPU information
alias gpumeminfo='grep -i --color memory /var/log/Xorg.0.log'                                           # Show GPU memory info
