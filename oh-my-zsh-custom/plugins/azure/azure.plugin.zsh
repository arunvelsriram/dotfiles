alias findsubscription='az account list | jq -r ".[] | [.id, .name] | @tsv" | fzf --height=20 --ansi --reverse'

function _azure_select_subscription() {
  echo "Select an Azure subscription:" >&2
  local subscription=$(az account list | jq -r '["ID", "NAME"], (.[] | [.id, .name]) | @tsv' | column -t -s $'\t' | fzf --height=20 --ansi --reverse --prompt="Subscription: " --header-lines=1)

  if [ -z "$subscription" ]; then
    echo "No subscription selected" >&2
    return 1
  fi

  local subscription_id=$(echo "$subscription" | awk '{print $1}')
  local subscription_name=$(echo "$subscription" | awk '{$1=""; sub(/^ +/, ""); print}')

  echo "$subscription_id|$subscription_name"
}

function _azure_select_aks_cluster() {
  local subscription_id="$1"
  echo "\nFetching AKS clusters..." >&2
  local cluster=$(az aks list --subscription "$subscription_id" --query '[].{name:name, resourceGroup:resourceGroup}' -o json | \
    jq -r '["NAME", "RESOURCE_GROUP"], (.[] | [.name, .resourceGroup]) | @tsv' | \
    column -t -s $'\t' | \
    fzf --height=20 --ansi --reverse --prompt="AKS Cluster: " --header-lines=1)

  if [ -z "$cluster" ]; then
    echo "No cluster selected" >&2
    return 1
  fi

  local cluster_name=$(echo "$cluster" | awk '{print $1}')
  local resource_group=$(echo "$cluster" | awk '{print $2}')

  echo "$cluster_name|$resource_group"
}

function findaks() {
  local subscription_payload=$(_azure_select_subscription) || return 1
  local subscription_id=$(echo "$subscription_payload" | awk -F'|' '{print $1}')
  local subscription_name=$(echo "$subscription_payload" | awk -F'|' '{print $2}')

  echo "Selected subscription: $subscription_name"

  local cluster_payload=$(_azure_select_aks_cluster "$subscription_id") || return 1
  local cluster_name=$(echo "$cluster_payload" | awk -F'|' '{print $1}')
  local resource_group=$(echo "$cluster_payload" | awk -F'|' '{print $2}')

  echo "\nCluster Details:"
  az aks show --subscription "$subscription_id" --name "$cluster_name" --resource-group "$resource_group" \
    --query "{SUBSCRIPTION: '$subscription_name', CLUSTER_NAME: name, RESOURCE_GROUP: resourceGroup}" \
    -o table
}

function findakscred() {
  local subscription_payload=$(_azure_select_subscription) || return 1
  local subscription_id=$(echo "$subscription_payload" | awk -F'|' '{print $1}')
  local subscription_name=$(echo "$subscription_payload" | awk -F'|' '{print $2}')

  echo "Selected subscription: $subscription_name"

  local cluster_payload=$(_azure_select_aks_cluster "$subscription_id") || return 1
  local cluster_name=$(echo "$cluster_payload" | awk -F'|' '{print $1}')
  local resource_group=$(echo "$cluster_payload" | awk -F'|' '{print $2}')
  local context_name="${subscription_name} -- ${cluster_name}"

  echo "\nGetting credentials for $cluster_name..."
  az aks get-credentials --subscription "$subscription_id" --name "$cluster_name" --resource-group "$resource_group" --context "$context_name"
}
