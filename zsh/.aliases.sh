# List Aliases with Icons and Color
alias ll='eza -alF --icons --color=always --group-directories-first' 
alias la='eza -a --icons --color=always --group-directories-first'
alias l='eza -F --icons --color=always --group-directories-first'
alias l.='eza -a | egrep "^\."'
alias sl='ls'
# Network Port Listing
alias ports='sudo netstat -tulpn | grep LISTEN'

# Package Management
alias pkg="$PACKAGE_MANAGER"
alias dnf='sudo dnf'
alias apt='sudo apt'

# Package Management (for Fedora)
#alias dnf='sudo dnf'
#alias apt='sudo dnf'

# Clearing the Terminal
alias c='clear'
alias clc='clear'

# Exiting the term
alias q=safe_exit
alias :q=safe_exit
alias q\!='exit'
alias :q!='exit'
alias wq='exit'
alias :wq='exit'
alias x=safe_exit

# System Operations
alias reboot='sudo reboot'

# Calculator
alias bc='bc -l'
alias calc='bc -l'

# Directory Operations
alias mkdir='mkdir -pv'

# Colored Diff
alias diff='colordiff'

# Jobs
alias j='jobs -l'

# Display Current Time
alias now='date +%r'

# Terminal Multiplexer
alias tm='tmux'

# Python Server and Virtual Environment
alias pyserve='python3 -m http.serve'
alias startvenv='source venv/bin/activate'

# Git
alias g='git'
alias gs='git status'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit'
alias gcm='git commit -m'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gbd='git branch -d'
alias gbr='git branch'
alias gpl='git pull'
alias gph='git push origin HEAD'
alias 'git pop'='git stash pop'

# Git Log Visualization
alias gid='git log --all --decorate --oneline --graph'
alias git-dog='git log --all --decorate --oneline --graph'

# SSH Agent
alias token='eval `ssh-agent` && ssh-add ~/.ssh/id_rsa'

# Docker
alias dockerun='docker run -it --volume "$(pwd):$(pwd)" ubuntu:latest'
alias dockerstop='docker stop $(docker ps -a -q)'
alias dockerkill='docker kill $(docker ps -q)'
alias dockerrm='docker rm $(docker ps -a -q)'

# Docker Compose
alias dc='docker-compose'
alias dcb='docker-compose build'
alias dkys='docker stop "$(docker ps -aq)" && docker rm "$(docker ps -aq)"'

# !!
alias please='sudo !!'

# Vim
alias vim='vim -p'

# Bat
alias car='batcat'
alias cat='batcat --style=plain' 

# Disk Usage
alias du='du -h'

# Copy to clipboard
alias ccp='xclip -selection clipboard <'

# python venv
alias 'activate'='source .venv/bin/activate'
