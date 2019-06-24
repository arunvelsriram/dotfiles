#!/usr/bin/env bash

about-plugin 'awsume helper functions'

# switch awsume profile
function assume-profile {
  local query=$1
  local fzf_args="--layout=reverse --height=15"
  [ -n "${query}" ] && fzf_args="${fzf_args} -q ${query}"
  awsume $(awsume -l | tail -n +5 | awk '{ print $1 }' | fzf ${fzf_args})
}
