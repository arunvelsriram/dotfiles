#!/usr/bin/env bash


cite about-plugin
about-plugin 'OS X volume manipulation functions'

function increment_volume() {
  local current
  local new

  current=$(osascript -e "output volume of (get volume settings)")
  new=$((current + 5))
  osascript -e "set volume output volume $new"
}

function decrement_volume() {
  local current
  local new

  current=$(osascript -e "output volume of (get volume settings)")
  new=$((current - 5))
  osascript -e "set volume output volume $new"
}

function toggle_mute() {
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

