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
  ANVIM_DEBUG=${ANVIM_DEBUG:=0}

  [ "${ANVIM_DEBUG}" = "1" ] && echo "Will be printing DEBUG messages"

  local target="${PWD}"
  if [ -n "${1}" ]; then
    target=$(realpath "$1")
  fi

  local wdir="${target}"
  if [ -f "${target}" ]; then
    wdir=$(dirname "${target}")
  fi

  [ "${ANVIM_DEBUG}" = "1" ] && echo "target: ${target}, wdir: ${wdir}"

  which nohup
  nohup alacritty --config-file ~/.config/alacritty/anvim.yml \
    --working-directory "${wdir}" \
    -t "nvim - ${target}" \
    -e $SHELL -lc "nvim ${target}" >/dev/null &
}

## Aliases

# vim
alias vim="nvim"

# edit config
alias zshconf="vim ~/.zshrc"
alias alacrittyconf="vim ~/.config/alacritty/alacritty.yml"
alias tmuxconf="vim $HOME/.tmux.conf.local"
alias vimconf="vim $HOME/.config/nvim/init.vim"

# cat
alias cat="bat"

# ping
alias ping="prettyping --nolegend"

# top
alias top="htop"

# github dir
alias gh='cd $(fd --max-depth 2 . ~/github/ | fzf)'

