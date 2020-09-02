### tmux helpers

## Functions

# kill all open sessions
tmux-kill-all() {
    tmux list-sessions | rg -v attached | awk '{print $1}' | sed 's/://g' | xargs -I {} tmux kill-session -t {}
}

# select open sessions (using tab key) and kill them
tmux-kill() {
    tmux list-sessions | rg -v attached | awk '{print $1}' | sed 's/://g' | fzf -m | xargs -I {} tmux kill-session -t {}
}

