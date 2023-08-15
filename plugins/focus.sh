#!/bin/bash

source "$CONFIG_DIR/colors.sh"
source "$CONFIG_DIR/icons.sh"
FOCUS="/Users/asc/repo/_cloned_/focus/bin/focus"

line=$($FOCUS status | grep "\[")

state=$(echo $line | awk '{print $1 " " $2}')
# [Work 2/4]: or [Short break]: or [Not Running]
if [[ $state == *"break"* ]]; then
	ic="$RESTING"
else
	ic="$WORKING"
fi

t=$(echo $line | awk '{print $3}')
la="$t"

if [[ $state == *"Not Running"* ]]; then
	ic="$WORKING"
	la="Start"
fi

# change icon when mutex is on
# i.e. no prompt to ask for starting a session in idle time
mutex=$(osascript -e 'tell application "Keyboard Maestro Engine" to getvariable "promptMutex"')
if [[ $mutex == "on" ]]; then
	ic="$LOCKING"
fi

# update
sketchybar --set focus icon="$ic" label="$la"

# handle click

left_click() {
	echo left!
	if [ "$MODIFIER" = "cmd" ]; then
		if [[ $mutex == "off" ]]; then
			osascript -e 'tell application "Keyboard Maestro Engine" to setvariable "promptMutex" to "on"'
		else
			osascript -e 'tell application "Keyboard Maestro Engine" to setvariable "promptMutex" to "off"'
		fi
	else
		if [[ $state == *"Not Running"* ]]; then
			$FOCUS resume
		else
			killall -INT focus
		fi
	fi
}

right_click() {
	echo right!
	if [[ $state == *"Not Running"* ]]; then
		if [ "$MODIFIER" = "cmd" ]; then
			$FOCUS -w 0 -s 0
		else
			$FOCUS
		fi
	else
		killall -INT focus
	fi
}

mouse_clicked() {
	case "$BUTTON" in
	"left")
		left_click
		;;
	"right")
		right_click
		;;
	esac
}

mouse_entered() {
	sketchybar --set focus icon.color=$BLUE label.color=$BLUE
}

mouse_exited() {
	sketchybar --set focus icon.color=$ICON_COLOR label.color=$LABEL_COLOR
}

case "$SENDER" in
"mouse.clicked")
	mouse_clicked
	;;
"mouse.entered")
	mouse_entered
	;;
"mouse.exited")
	mouse_exited
	;;
esac
