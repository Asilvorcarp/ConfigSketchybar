#!/bin/bash

focus=(
  icon=cal
  icon.font="$FONT:Black:12.0"
  icon.padding_right=6
  label.font="$FONT:Black:12.0"
  padding_right=16
  label.width=45
#   label.align=right
#   padding_left=15
  update_freq=1
  script="$PLUGIN_DIR/focus.sh"
)

sketchybar --add item focus right           \
           --set focus "${focus[@]}"        \
           --subscribe focus mouse.clicked  \
                             mouse.entered  \
                             mouse.exited   \
