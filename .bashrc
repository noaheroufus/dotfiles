#
# ~/.bashrc
# Noah Roufus

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Set TERM
export TERM='xterm-256color'
export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'

# Prompt config
export PS1='\[\e[0m\]\[\e[1;36m\]\u\[\e[0m\]\[\e[1;37m\]@\[\e[1;35m\]\h\[\e[1;37m\]:\[\e[33m\]\w\[\e[1;37m\]$\[\e[0m\] '

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
alias yay='yay --color=auto'
alias mkd='mkdir -pv'
alias cdp='cd ~/.projects'
alias cdd='cd ~/Documents'
alias cdl='cd ~/Downloads'
alias cdc='cd /data/Containers'
alias clr='clear && pfetch'

# TheFuck
eval "$(thefuck --alias)"

# pFetch
pfetch
