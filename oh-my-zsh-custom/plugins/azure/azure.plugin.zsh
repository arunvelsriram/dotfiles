alias findsubscription='az account list | jq -r ".[] | [.id, .name] | @tsv" | fzf --height=20 --ansi --reverse'

function findaks() {
  # Select subscription
  echo "Select an Azure subscription:"
  local subscription=$(az account list | jq -r '["ID", "NAME"], (.[] | [.id, .name]) | @tsv' | column -t -s $'\t' | fzf --height=20 --ansi --reverse --prompt="Subscription: " --header-lines=1)

  if [ -z "$subscription" ]; then
    echo "No subscription selected"
    return 1
  fi

  local subscription_id=$(echo "$subscription" | awk '{print $1}')
  local subscription_name=$(echo "$subscription" | cut -f2-)

  echo "Selected subscription: $subscription_name"

  # List and select AKS cluster
  echo "\nFetching AKS clusters..."
  local cluster=$(az aks list --subscription "$subscription_id" --query '[].{name:name, resourceGroup:resourceGroup}' -o json | \
    jq -r '["NAME", "RESOURCE_GROUP"], (.[] | [.name, .resourceGroup]) | @tsv' | \
    column -t -s $'\t' | \
    fzf --height=20 --ansi --reverse --prompt="AKS Cluster: " --header-lines=1)

  if [ -z "$cluster" ]; then
    echo "No cluster selected"
    return 1
  fi

  local cluster_name=$(echo "$cluster" | awk '{print $1}')
  local resource_group=$(echo "$cluster" | awk '{print $2}')

  echo "\nCluster Details:"
  az aks show --subscription "$subscription_id" --name "$cluster_name" --resource-group "$resource_group" \
    --query "{SUBSCRIPTION: '$subscription_name', CLUSTER_NAME: name, RESOURCE_GROUP: resourceGroup}" \
    -o table
}
