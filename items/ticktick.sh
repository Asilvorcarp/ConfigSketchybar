#!/bin/bash

TickTick=(
  alias.update_freq=1
  alias.color=$ICON_COLOR
#   click_script="$PLUGIN_DIR/zen.sh"
)

sketchybar --add alias TickTick right \
           --set TickTick "${TickTick[@]}"
