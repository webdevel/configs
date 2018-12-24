# individual per-interactive-shell startup file

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

shopt -s checkwinsize
stty -ixon


# added by travis gem
[ -f /Users/steven/.travis/travis.sh ] && source /Users/steven/.travis/travis.sh
