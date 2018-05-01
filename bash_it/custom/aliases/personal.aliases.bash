cite 'about-alias'
about-alias 'my personal aliases'

# Vim
alias vimr='vimr -s'

# Tig
alias t='tig'

# highlight
alias hcat='highlight -O ansi --force'

# ls
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
