### OS X volume manipulation

## Functions

# increase volume by 5
increment_volume() {
  local current
  local new

  current=$(osascript -e "output volume of (get volume settings)")
  new=$((current + 5))
  osascript -e "set volume output volume $new"
}

# decrease volume by 5
decrement_volume() {
  local current
  local new

  current=$(osascript -e "output volume of (get volume settings)")
  new=$((current - 5))
  osascript -e "set volume output volume $new"
}

# toggle mute on/off
toggle_mute() {
  local current
  local new

  current=$(osascript -e "output muted of (get volume settings)")
  if [ "$current" == "true" ]; then
    new="false"
  elif [ "$current" == "false" ]; then
    new="true"
  fi
  osascript -e "set volume output muted $new"
}

