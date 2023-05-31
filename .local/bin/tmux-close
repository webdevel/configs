#!/usr/bin/sh

SCRIPT=$(basename $0)
session=session
SUCCESS=0
is_tmux_on_path=$(type tmux &>/dev/null; echo $?)
all_sessions=not

show_help()
{
cat << EOF

Close tmux session.

Usage: $SCRIPT [OPTIONS]

OPTIONS:
  -h    Show this help message
  -s    Session name in tmux (default: $session)
  -a    All sessions (default: $all_sessions)

EXAMPLES:
  ./$SCRIPT -s $session

EOF
}

while getopts "hs:a" option; do

  case $option in

    h)
      show_help
      exit
      ;;
    s)
      session=$OPTARG
      ;;
    a)
      all_sessions=yes

  esac

done

if [[ $is_tmux_on_path -ne $SUCCESS ]]; then

  echo "Tmux not found."
  exit $is_tmux_on_path

fi

# get all window.pane pairs in session
panes=$(tmux list-panes -a | cut -d : -f 1,2 | sort -r)

# iterate though all window.pane pairs in session
for pane in $panes; do

  [[ "not" == "$all_sessions" && "${pane##"${session}:"*}" == "${pane}" ]] && continue

  tmux send-keys -t $pane 'exit' enter

done
