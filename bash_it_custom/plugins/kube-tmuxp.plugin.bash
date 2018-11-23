#!/usr/bin/env bash

cite about-plugin
about-plugin 'kube-tmuxp helper funtions'

# switch kube contexts (or tmux sessions)
function kubeswitch {
  fd .  -t f -e yaml ~/.tmuxp --exec echo {/.} | fzf --bind 'enter:execute-silent(tmuxp load --yes {1})+abort'
}

# kill all open sessions
function tmux-kill-all {
    tmux list-sessions | rg -v attached | awk '{print $1}' | sed 's/://g' | xargs -I {} tmux kill-session -t {}
}

# select open sessions (using tab key) and kill them
function tmux-kill {
    tmux list-sessions | rg -v attached | awk '{print $1}' | sed 's/://g' | fzf -m | xargs -I {} tmux kill-session -t {}
}
