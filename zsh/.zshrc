# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Package Manager

export PACKAGE_MANAGER="=PM="

ZSH_THEME="agnoster" # set by `omz`
source $ZSH/oh-my-zsh.sh

plugins=(git)

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

# Swap Caps Lock and Escape Keys (For Vim)
setxkbmap -option caps:swapescape

eval "$(atuin init zsh)"

# if [ "$TMUX" = "" ]; then tmux; fi



PATH="/home/ru4en/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/ru4en/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/ru4en/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/ru4en/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/ru4en/perl5"; export PERL_MM_OPT;

# Export PATH for programing languages and tools

# NVim
export PATH="$PATH:/opt/nvim-linux64/bin"

# GO
export PATH=$PATH:/usr/local/go/bin

# Conda
export PATH="$HOME/miniconda3/bin:$PATH"

# PY env
alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'
