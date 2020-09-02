### personal aliases and functions

## Functions

# long list absolute path to command
lwhich() {
  [ -z $1 ] && echo "Argument missing" && return 1
  ls -l $(which $1)
}

## Aliases

# edit config
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias alacrittyconfig="nvim ~/.config/alacritty/alacritty.yml"
alias tmuxconf="nvim $HOME/.tmux.conf.local"

# cat
alias cat="bat"

# ping
alias ping="prettyping --nolegend"

# top
alias top="htop"

# nvim
alias vim="nvim"

# github dir
alias gh='cd $(fd --max-depth 2 . ~/github/ | fzf)'

