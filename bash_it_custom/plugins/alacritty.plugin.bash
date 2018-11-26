#!/usr/bin/env bash

about-plugin 'alacritty helper functions'

# change color scheme
function chcolor {
  [ -z "$1" ] && echo "color scheme name required" && return 1

  local color=$1
  sed -i ' '  "s/colors: \*.*/colors: \*${color}/g" ~/.config/alacritty/alacritty.yml
}
