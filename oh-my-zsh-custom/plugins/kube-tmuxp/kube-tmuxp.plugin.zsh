### kube-tmuxp helpers

## Functions

# switch kube contexts (or tmux sessions)
kubeswitch() {
  fd .  -t f -e yaml ~/.tmuxp --exec echo {/.} | fzf --bind 'enter:execute-silent(tmuxp load --yes {1})+abort'
}

