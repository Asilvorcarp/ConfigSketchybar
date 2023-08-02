#!/bin/bash

# parameters
text="${1:-"ABC"}"
duration="${2:-"1"}"
id="${3:-$$}" # the process id

echo "Text: $text"
echo "Duration: $duration"
echo "Id: $id"

# Fix cannot find sketchybar
eval "$(/opt/homebrew/bin/brew shellenv)"

PROMPT_SCRIPT="sketchybar -m --set prompt.anchor popup.drawing=toggle"
FONT="SF Pro" # Needs to have Regular, Bold, Semibold, Heavy and Black variants
ANCHOR="prompt.anchor.$id"
TITLE="prompt.title.$id"

prompt_anchor=(
  popup.horizontal=on
  popup.align=center
  popup.height=30
  popup.y_offset=500  # TODO test this
  popup.drawing=on
  label.drawing=off
  icon.drawing=off
  padding_left=-19  # TODO fix this
  padding_right=0
  width=0
)

prompt_title=(
  icon.drawing=off
  padding_left=6
  padding_right=5
  label.font="$FONT:Bold:16.0"
  align=center
  label="$text"
)

pop() {
    sketchybar --add item $ANCHOR center              \
            --set $ANCHOR "${prompt_anchor[@]}"       \
                                                      \
            --add item $TITLE popup.$ANCHOR           \
            --set $TITLE "${prompt_title[@]}"         \

    sleep $duration

    sketchybar --remove $ANCHOR
}

pop
