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
