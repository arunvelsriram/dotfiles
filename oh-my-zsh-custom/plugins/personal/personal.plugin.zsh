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

# remove quarantine xattr from app
unquarantine() {
  [ -z "$1" ] && echo "Path to Application is required" && return 1
  xattr -d com.apple.quarantine $1
}

## Aliases

# vim
alias vim="nvim"

# edit config
alias zshconf="vim ~/.zshrc"
alias alacrittyconf="vim ~/.config/alacritty/alacritty.yml"
alias tmuxconf="vim $HOME/.tmux.conf.local"
alias vimconf="vim $HOME/config/nvim/init.vim"

# cat
alias cat="bat"

# ping
alias ping="prettyping --nolegend"

# top
alias top="htop"

# github dir
alias gh='cd $(fd --max-depth 2 . ~/github/ | fzf)'

