# personal initialization file, executed for login shells

# execute bashrc if readable
test -r ~/.bashrc && . ~/.bashrc

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=4500
HISTFILESIZE=9000

alias ls='ls --color=auto'
alias ll='ls -l'
alias grep='grep --color=auto'

export GREP_COLOR="0;32"

# less command color
export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'
export LESS_TERMCAP_md=$'\E[1;36m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[1;32m'

# broken symlink color
eval $(dircolors -b)

PS1='\u@\h \W \$ '

if test "Darwin" = "$(uname -s)"; then

  complete -d cd
  source ~/.bash_completion/git-completion.bash

#  export TERM=darwin-256x96 # immediately followed by
  export TERM=xterm-256color # immediately followed by
  /usr/bin/tput init
  export CLICOLOR=1
  export LSCOLORS=ExFxBxDxCxegedabagacad

  export PS1='\W \$ '

  export PATH="/opt/local/bin:/opt/local/sbin:$PATH"

  export PATH=/Applications/VirtualBox.app/Contents/MacOS:$PATH
  export PATH=~/Downloads/couchbase/Couchbase\ Server.app/Contents/MacOS:$PATH
  export PATH=~/Downloads/eclipse/Eclipse.app/Contents/MacOS:$PATH
  export PATH=~/Downloads/eventstore:$PATH
  export PATH=~/Downloads/gradle/bin:$PATH
  export PATH=~/Downloads/maven/bin:$PATH
  export PATH=~/Downloads/mongodb/bin:$PATH
  export PATH=~/Library/Android/sdk/tools:$PATH
  export PATH=~/Library/Android/sdk/platform-tools:$PATH

fi

#eval $(ssh-agent)
#ssh-add ~/.ssh/id_rsa
#ssh-add ~/.ssh/id_rsa_webwhammy

if test "root" != "$USER" && test -z $DISPLAY && test -n $XDG_VTNR && test 1 -eq $XDG_VTNR; then

  exec startx -- -quiet

fi

