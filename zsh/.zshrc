# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

 export LANG=en_GB.UTF-8
export LC_ALL=en_GB.UTF-8

ZSH_THEME="agnoster" # set by `omz`

plugins=(git sudo adb battery docker docker-compose dotenv golang pip python rust systemd tmux tmuxinator vagrant virtualenv)
source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='mvim'
fi

# Load All Aliases
source ~/.aliases.sh

# Load All Functions
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
