cite 'about-alias'
about-alias 'my personal aliases'

## vimr
alias vimr='vimr -s'

## ls
if ls --color -d . &> /dev/null
then
  alias ls="ls --color=auto"
elif ls -G -d . &> /dev/null
then
  alias ls='ls -G'        # Compact view, show colors
fi

alias sl=ls
alias la='ls -AF'       # Compact view, show hidden
alias ll='ls -al'
alias l='ls -a'

## cat
alias cat="bat"

## ping
alias ping="prettyping --nolegend"

## top
alias top="htop"

## nvim
alias vim="nvim"

# github dir
alias github='cd $(fd --max-depth 1 . ~/github/*/ | fzf)'
