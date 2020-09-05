### personal aliases and functions

## Functions

# long list absolute path to command
lwhich() {
  [ -z $1 ] && echo "Argument missing" && return 1
  ls -l $(which $1)
}

# git clone in to user-or-org/repo
cloneg() {
    repo_url=${@:$#}
    project=$(basename $repo_url)
    project=$(echo $project | sed 's/.git//')
    group=$(echo $(dirname $repo_url) | sed -E 's/(.*)(:|\/)(.*)/\3/g')

    echo "Group: $group"
    echo "Project: $project"

    git clone "$@" $group/$project
}

## Aliases

# edit config
alias zshconf="nvim ~/.zshrc"
alias alacrittyconf="nvim ~/.config/alacritty/alacritty.yml"
alias tmuxconf="nvim $HOME/.tmux.conf.local"
alias nvimconf="nvim $HOME/.config/nvim/init.vim"

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

