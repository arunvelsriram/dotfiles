#!/usr/bin/env bash

cite about-plugin
about-plugin 'kube-tmuxp helper funtions'

function kubeswitch {
  fd .  -t f -e yaml ~/.tmuxp --exec echo {/.} | fzf --bind 'enter:execute-silent(tmuxp load --yes {1})+abort'
}

function tmux-kill-all {
    tmux list-sessions | rg -v attached | awk '{print $1}' | sed 's/://g' | xargs -I {} tmux kill-session -t {}
}

function tmux-kill {
    tmux list-sessions | rg -v attached | awk '{print $1}' | sed 's/://g' | fzf -m | xargs -I {} tmux kill-session -t {}
}
