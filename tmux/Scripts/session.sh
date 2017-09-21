#!/bin/sh

START_DIR=$(pwd)
SCRIPT=$(basename $0)
SUCCESS=0
EQUALS=-eq
NOT_EQUALS=-ne
LESS_THAN=-lt
editor=vim
session=tmux
windows=0
lines=9
isSessionCreated=1
isTmuxOnPath=$(type tmux &>/dev/null; echo $?)
prefix=C-t

showHelp()
{
cat << EOF

Create tmux session.

Usage: $SCRIPT [OPTIONS]

OPTIONS:
  -h    Help message
  -s    Session name in tmux (default: $session)
  -w    Windows created in session (default: $windows)
  -l    Lines as the height of the bottom pane (default: $lines)
  -e    Editor to use (default: $editor)
  -p    Prefix for tmux (default: $prefix)
  -c    Close tmux windows, one or more comma delimited

EXAMPLES:
  ./$SCRIPT -s $session -w $windows -l $lines -e $editor -p $prefix
  ./$SCRIPT -c 1
  ./$SCRIPT -c 1,3,5,9

EOF
}

# close window function
closeWindow()
{

  # renumber windows when they are removed
  tmux set-option renumber-windows on


  # iterate through user specified windows to close
  for window in $close; do

    # do not close the first window
    if test "0" = "$window"; then

      # skip this iteration
      continue

    fi

    # exit tmux session
    tmux send-keys -t $session:$window.0 "exit" enter

  done

}

# use getopts to parse command-line arguments/options
while getopts "hs:w:l:e:p:c:" option; do

  case $option in

    h)
      showHelp
      exit
      ;;
    s)
      session=$OPTARG
      ;;
    w)
      windows=$OPTARG
      ;;
    l)
      # ToDo marshall user input.
      # do not want negative or insane numbers here
      lines=$OPTARG
      ;;
    e)
      editor=$OPTARG
      ;;
    p)
      prefix=$OPTARG
      ;;
    c)
      close=$(echo $OPTARG | sed 's#,#\ #g')
      closeWindow
      exit $?
      ;;

  esac

done

# tell the user when tmux is not found and exit
if test $SUCCESS $NOT_EQUALS $isTmuxOnPath; then

  echo "Tmux not found."

  # exit with error status
  exit $isTmuxOnPath

fi

# list sessions and check if it exists
doesSessionExist=$(tmux list-sessions 2>/dev/null | grep "$session" &>/dev/null; echo $?)

# only create session if it does not exist already
if test $SUCCESS $NOT_EQUALS $doesSessionExist; then

  # create tmux session, but do not attach to it yet
  tmux new-session -ds $session

  # get exit status of tmux new-session
  isSessionCreated=$?

  # split window vertically
#  tmux split-window -vl $lines -t $session:0.0

fi

# only create additional windows if windows count is a positive number we expect
if test 0 $LESS_THAN $windows; then

  # iterate through window count sequence
  for window in $(seq 1 $windows); do

    # attempt to create window while suppressing errors
    tmux new-window -dt $session:$window 2>/dev/null

  done

fi

# only select window pane if session is created
if test $SUCCESS $EQUALS $isSessionCreated; then

  tmux select-window -t $session:0
  tmux select-pane -t $session:0.0

  # start editor in main window pane
#  tmux send-keys -t $session:0.0 "$editor" enter

  # do not attach to session in this script or it will not exit until tmux does
  printf '\n%s\n' "NOW TRY: tmux attach -t $session"

fi

# exit with the last commands exit status
exit $?
