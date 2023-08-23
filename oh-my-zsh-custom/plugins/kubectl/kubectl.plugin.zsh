### kubectl helpers

## Functions

# get node internal ip
node-iip() {
  kubectl get node -o jsonpath='{range .items[*]}{.metadata.name}{"\t"}{.status.addresses[?(@.type=="InternalIP")].address}{"\n"}{end}'
}

# get node external ip
node-eip() {
  kubectl get node -o jsonpath='{range .items[*]}{.metadata.name}{"\t"}{.status.addresses[?(@.type=="ExternalIP")].address}{"\n"}{end}'
}

alias k='kubectl'
alias ktx='kubectx'
alias kns='kubens'


# fzf and activate kube context using individual kubeconfig files
# USAGE: kshell <env>
kshell() {
  local env=${1:-$(ls ${HOME}/.kube/configs | fzf --height=20 --ansi --reverse)}
  local kubeconfig="${HOME}/.kube/configs/${env}/$(echo $(fd yaml ${HOME}/.kube/configs/${env} --exec basename {} | fzf --height=20 --ansi --reverse))"
  local commands="export KUBECONFIG=${kubeconfig}"
  echo "${commands}"
  eval "${commands}"
}

# splits the configs having 'kind-' in the cluster name from ~/.kube/config and store output under ~/.kube/configs/local
split-local-kubeconfigs() {
  local output_dir=~/.kube/configs/local
  for k in $(kubectl config get-contexts --kubeconfig ~/.kube/config -o name | grep 'kind-'); do
    mkdir -p ${output_dir}
    kubectl config view --kubeconfig ~/.kube/config --context=${k} --minify --flatten > ${output_dir}/${k}.yaml
  done
}