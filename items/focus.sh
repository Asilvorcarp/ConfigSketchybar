#!/bin/bash

focus=(
	icon=cal
	icon.font="$FONT:Black:12.0"
	icon.padding_right=6
	label.font="$FONT:Black:12.0"
	padding_right=16
	label.width=45
	update_freq=1
	script="$PLUGIN_DIR/focus.sh"
	#   label.align=right
	#   padding_left=15
)

# keep on reminding to start a focus session
always_focus=(
	# width=0
	# label.width=0
	# drawing=off
	# label.drawing=off
	update_freq=180
	script="$PLUGIN_DIR/always_focus.sh"
)

sketchybar --add item focus right \
	--set focus "${focus[@]}" \
	--subscribe focus mouse.clicked \
	mouse.entered \
	mouse.exited \
	--add item always_focus right \
	--set always_focus "${always_focus[@]}"
