# ~/.zshrc
# Noah Roufus
#

# Start window manager
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx > /dev/null 2>&1
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# oh-my-zsh plugins
plugins=(git zsh-autosuggestions)

# Initialize oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Configure history settings
HISTFILE=~/.cache/zsh/zsh_history
HISTSIZE=1000
SAVEHIST=1000

# Remove console beep
unsetopt autocd beep

# Turn on vi/vim key bindings
bindkey -v

# Key bindings
bindkey '^[[1~' beginning-of-line
bindkey '^[[4~' end-of-line
bindkey '\033[1;3C' forward-word
bindkey '\033[1;3D' backward-word

# Autocomplete stuff
autoload -Uz compinit
compinit -d $HOME/.cache/zsh/zcompdump

# Prompt
export PS1="%B%F{cyan}%n%F{white}@%F{magenta}%m%F{white}:%F{yellow}%~%F{white}$%b "

# Append to path
path+="$HOME/.local/bin"

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
