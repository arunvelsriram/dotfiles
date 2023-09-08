### GCP and gcloud CLI functions

## Functions

# open GCP project console in browser
opengcp () {
  project=$(gcloud projects list \
    | rg -v PROJECT_ID \
    | awk '{print $1}' \
    | fzf --reverse --height 20)
  [ -z "$project" ] && return
  open https://console.cloud.google.com/home/dashboard?project=$project
}


# print IP CIDR for all clusters
cluster_ip_cidr() {
  gcloud projects list \
    | tail -n +2 \
    | awk -v q=\' '{ printf "gcloud --project %s container clusters list --format json | jq -rc %s.[] | \"\\(.name + \"\t\" + .clusterIpv4Cidr)\"%s\n", $1, q, q }' \
    | bash
}

alias gcpproject='gcloud config set project $(gcloud projects list --format json | jq -r ".[] | .projectId" | fzf)'
