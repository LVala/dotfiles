########## BASHRC ##########

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

HISTFILE=$HOME/.bash_history
HISTSIZE=5000
HISTFILESIZE=5000

# append to history file, don't overwrite it
shopt -s histappend

# prompt
PS1="\[\e[1m\]\u\[\e[1;36m\]\[\033[m\]@\[\e[1;36m\]\h\[\033[m\]:\[\e[0m\]\[\e[1;32m\][\W]> \[\e[0m\]"

# aliases
alias ls='ls --color=auto --group-directories-first -Fh'
alias ll='ls -la'
alias mkdir='mkdir -p'
alias vim='nvim'
alias v='vim'
