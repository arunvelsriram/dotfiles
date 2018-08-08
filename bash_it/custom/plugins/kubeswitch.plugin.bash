#!/usr/bin/env bash

cite about-plugin
about-plugin 'Easily switch kubernetes context using tmuxp'

function kubeswitch {
  fd .  -t f -e yaml ~/.tmuxp --exec echo {/.} | fzf --bind 'enter:execute-silent(tmuxp load --yes {1})+abort'
}
