#!/usr/bin/env bash

about-plugin 'GCP and gcloud CLI functions'

opengcp () {
  project=$(gcloud projects list \
    | rg -v PROJECT_ID \
    | awk '{print $1}' \
    | fzf --reverse --height 20)
  [ -z "$project" ] && return
  open https://console.cloud.google.com/home/dashboard?project=$project
}


cluster_ip_cidr() {
  gcloud projects list \
    | tail -n +2 \
    | awk -v q=\' '{ printf "gcloud --project %s container clusters list --format json | jq -rc %s.[] | \"\\(.name + \"\t\" + .clusterIpv4Cidr)\"%s\n", $1, q, q }' \
    | bash
}
