# ~/.zshrc
# Noah Roufus
#

# Configure history settings
HISTFILE=~/.cache/zsh/history
HISTSIZE=1000
SAVEHIST=1000

# Remove console beep
unsetopt autocd beep

# Turn on vi/vim key bindings
bindkey -v

# Autocomplete stuff
autoload -Uz compinit
compinit

# Prompt
export PS1="%B%F{cyan}%n%F{white}@%F{magenta}%m%F{white}:%F{yellow}%~%F{white}$%b "

# Prepend to $PATH
export PATH="~/.local/bin:$PATH"

# Default text editor
export EDITOR="vim"
export VISUAL="vim"

# Command aliases
alias ls='ls --color=auto'
alias ll='ls -hAl --color=auto'
alias ip='ip --color=auto'
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias mkd='mkdir -pv'
alias cdp='cd ~/.projects'
alias cdd='cd ~/Documents'
alias cdl='cd ~/Downloads'
alias clr='clear && pfetch'

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# oh-my-zsh plugins
plugins=(git)

# Initialize oh-my-zsh
source $ZSH/oh-my-zsh.sh

# TheFuck
eval "$(thefuck --alias)"

# pFetch
/usr/bin/pfetch
