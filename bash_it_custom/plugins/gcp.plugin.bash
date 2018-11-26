#!/usr/bin/env bash

about-plugin 'open gcp project in browser'

opengcp () {
  project=$(gcloud projects list \
    | rg -v PROJECT_ID \
    | awk '{print $1}' \
    | fzf --reverse --height 20)
  [ -z "$project" ] && return
  open https://console.cloud.google.com/home/dashboard?project=$project
}
