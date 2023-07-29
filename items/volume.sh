#!/bin/bash

volume_slider=(
  script="$PLUGIN_DIR/volume.sh"
  updates=on
  label.drawing=off
  icon.drawing=off
  slider.highlight_color=$BLUE
  slider.background.height=5
  slider.background.corner_radius=3
  slider.background.color=$BACKGROUND_2
  slider.knob=􀀁
  slider.knob.drawing=off
)

volume_icon=(
  click_script="$PLUGIN_DIR/volume_click.sh"
  icon=$VOLUME_100
  icon.width=0
  icon.align=left
  icon.color=$GREY
  icon.font="$FONT:Regular:14.0"
  label.width=25
  label.align=left
  label.font="$FONT:Regular:14.0"
  padding_left=8
  padding_right=-3
)

status_bracket=(
  background.color=$BACKGROUND_1
  background.border_color=$BACKGROUND_2
)


# OPEN_SOUND_PREF="open /System/Library/PreferencePanes/Sound.prefPane"

volume_number=(
  padding_left=0
  padding_right=0
  label.padding_left=0
  label.padding_right=0
  update_freq=0
  script="$PLUGIN_DIR/volume_number.sh"
)


sketchybar --add slider volume right            \
           --set volume "${volume_slider[@]}"   \
           --subscribe volume volume_change     \
                              mouse.clicked     \
                              mouse.entered     \
                              mouse.exited      \
                                                \
           --add item volume_number right       \
           --set volume_number "${volume_number[@]}"   \
           --subscribe volume_number volume_change     \
                                     mouse.clicked     \
                                                       \
           --add item volume_icon right                \
           --set volume_icon "${volume_icon[@]}"

sketchybar --add bracket status brew github.bell volume_icon \
           --set status "${status_bracket[@]}"
