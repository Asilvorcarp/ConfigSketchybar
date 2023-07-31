#!/bin/bash

FOCUS="/Users/asc/repo/_cloned_/focus/bin/focus"
CMD_START_SESSION='tell application "Keyboard Maestro Engine" to do script "Ask to start a session"'

if [[ `pgrep focus` == "" ]]; then
    echo start a session
    nohup osascript -e "$CMD_START_SESSION" > /dev/null 2>&1 &
    exit
fi

# note:
# - set
# osascript -e 'tell application "Keyboard Maestro Engine" to setvariable "My KM Var" to "Some new value"'
# - get
# osascript -e 'tell application "Keyboard Maestro Engine" to getvariable "My KM Var"'
