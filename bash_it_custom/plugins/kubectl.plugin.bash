#!/usr/bin/env bash

cite about-plugin
about-plugin 'kubectl helper funtions'

# get node internal ip
function node-iip {
  kubectl get node -o jsonpath='{range .items[*]}{.metadata.name}{"\t"}{.status.addresses[?(@.type=="InternalIP")].address}{"\n"}{end}'
}

# get node external ip
function node-eip {
  kubectl get node -o jsonpath='{range .items[*]}{.metadata.name}{"\t"}{.status.addresses[?(@.type=="ExternalIP")].address}{"\n"}{end}'
}
