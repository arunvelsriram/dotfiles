#!/usr/bin/env bash

cite about-plugin
about-plugin 'Kill all sessions except the current one on tmux'

function tmux-kill-all {
    tmux list-sessions | rg -v attached | awk '{print $1}' | sed 's/://g' | xargs -I {} tmux kill-session -t {}
}

cite about-plugin
about-plugin 'Easily kill a tmux session by name'

function tmux-kill {
    tmux list-sessions | rg -v attached | awk '{print $1}' | sed 's/://g' | fzf -m | xargs -I {} tmux kill-session -t {}
}
