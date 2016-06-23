# individual per-interactive-shell startup file

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

shopt -s checkwinsize
shopt -s autocd
stty -ixon

