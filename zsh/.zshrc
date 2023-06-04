export PS1=" %1~ "
export LANG=en_US.UTF-8
export EDITOR=vim
export MYVIMRC=$HOME/.vimrc
export ZSH=$HOME/.zsh
# export FPATH="$ZSH/functions:$FPATH"
export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE=$ZSH/.zshistory
export COMPOSER_MEMORY_LIMIT=-1
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path $ZSH/cache
# color settings
export COLORTERM=truecolor
export TERM=xterm-256color # immediately followed by tput
/usr/bin/tput init
export CLICOLOR=1
# dircolors --print-ls-colors
# no 0     normal text
# fi 0     regular files
# di 32    directories
# ln 36    symbolic link
# pi 31    named pipes
# so 33    socket
# bd 44;37 block device
# cd 44;37 character device
# or 36    orphan symlink
# mi 0     missing file
# su 37;41 user file
# sg 30;43 group file
# tw 30;42 sticky world writable directory
# ow 34;43 not sticky world writable directory
# sa 0     suffix alias file
# st 37;44 sticky directory not world writable
# ex 35    executable file
# lc \e[   left code
# rc m     right code
# tc 0     file type character if LIST_TYPES set
# sp 0     match column spaces
# ec 0     end code
# rs 0     reset code
# mh 0     multihardlink
# ca 0     capability
# do 01;35 door
# *ext glob match
export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=00:tw=30;42:ow=34;42:st=37;44:ex=01;32:'
# export LSCOLORS=ExFxBxDxCxegedabagacad
export GREP_COLORS='mt=0;32'
# less and man command color
export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'
export LESS_TERMCAP_md=$'\E[1;36m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[1;32m'

# initialize shell auto-completion
autoload -Uz compaudit compinit zrecompile
# remove previous completion dump cache
exec 2>/dev/null
rm -rf $ZSH/.zcompdump
exec 2>/dev/tty
# load secure directories
# unset _compdir
compinit -w -d $ZSH/.zcompdump
# compdef compinstall zrecompile
zrecompile -q -p $ZSH/.zcompdump
# configure line editing like emacs
bindkey -e

alias ll='ls -la --color=auto'
alias git-log='git log --graph --decorate --pretty=oneline --abbrev-commit'
alias grep='grep --color=auto'
alias pacman='pacman --color=auto'

# auto-completion
# unsetopt menu_complete   # do not autoselect the first completion entry
# unsetopt flowcontrol
# setopt auto_menu         # show completion menu on successive tab press
# setopt complete_in_word
# setopt always_to_end

zstyle ':completion:*:make:*:targets' call-command true
zstyle ':completion:*:make:*' tag-order targets
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%B%d%b'

# zstyle ':completion:*:default' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
# :completion:function:completer:command:argument:tag
# dircolors --print-ls-colors
# zstyle ':completion:*:*:*:*:commands' list-colors "no=38;2;255;100;"
# printf "\x1b[38;2;55;100;100mTRUECOLOR\x1b[0m\n"

setopt nobeep
