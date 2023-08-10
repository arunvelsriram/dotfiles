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

# join zoom meeting
zoom-join() {
  name=$(cat $HOME/.zoom-ids.json | jq -r ".[] | .name" | fzf --height=10 --ansi --reverse)
  qparams=$(cat $HOME/.zoom-ids.json | jq -r ".[] | select(.name == \"$name\") | \"confno=\" + .id + \"&pwd=\" + .pwd ")
  open "zoommtg://zoom.us/join?$qparams"
}

# alacritty neovim
anvim() {
  local target="${PWD}"
  if [ -n "${1}" ]; then
    target=$(realpath "$1")
  fi

  local wdir="${target}"
  if [ -f "${target}" ]; then
    wdir=$(dirname "${target}")
  fi

  nohup alacritty --config-file ~/.config/alacritty/anvim.yml \
    --working-directory "${wdir}" \
    -t "nvim - ${target}" \
    -e $SHELL -lc "nvim ${target}" >/dev/null &
}

## Aliases

# edit config
alias zshconf="vim ~/.zshrc"
alias alacrittyconf="vim ~/.config/alacritty/alacritty.yml"
alias tmuxconf="vim $HOME/.tmux.conf.local"
alias vimconf="vim $HOME/.vimrc"
alias nvimconf="vim $HOME/.config/nvim/init.vim"

# vim
alias vim=nvim
alias vi=nvim

# ping
alias ping="prettyping --nolegend"

# top
alias top="htop"

# github dir
alias gh='cd $(fd --max-depth 2 . ~/github/ | fzf --height=20 --ansi --reverse)'

# fzf secret files and sops decrypt
alias sopsdecrypt='sops -d $(fd "secrets.yaml|terraform-sa.json" | fzf --height=20 --ansi --reverse)'

# yes/no prompt
yesno() {
    message=${1:="Do you want to continue ?"}
    read "response?$message [y/n] "
    response=${response:l}
    echo $response
}

# find and clean .terragrunt-cache directories
tgcacheclean() {
    local files=$(fd -HI .terragrunt-cache)
    local response
    [ -z "$files" ] && echo "Nothing to clean" && return
    echo $files
    response=$(yesno "Delete All ?")
    [ $response = "y" ] && rm -rfv $(echo $files | xargs)
}

# find and clean local tfstate files
tfstateclean() {
    local files=$(fd -HI terraform.tfstate)
    local response
    [ -z "$files" ] && echo "Nothing to clean" && return
    echo $files
    response=$(yesno "Delete All ?")
    [ $response = "y" ] && rm -rfv $(echo $files | xargs)
}
