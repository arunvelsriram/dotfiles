# Postgres
export POSTGRES_PATH="/Applications/Postgres.app/Contents/Versions/latest"
export PATH=$PATH:$POSTGRES_PATH/bin

# golang
export PATH=$(go env GOPATH)/bin:$PATH

# Increase bash history
export HISTSIZE=
export HISTFILESIZE=

# added by travis gem
[ -f /Users/arunvelsriram/.travis/travis.sh ] && source /Users/arunvelsriram/.travis/travis.sh

# git completion
source ~/.git-completion.bash

# bash completion
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# >>> talisman >>>
# Below environment variables should not be modified unless you know what you are doing
export TALISMAN_HOME=/Users/arunvelsriram/.talisman/bin
alias talisman=$TALISMAN_HOME/talisman_darwin_amd64
# <<< talisman <<<

# rbenv
eval "$(rbenv init -)"

# jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# node
export PATH="/usr/local/opt/node@10/bin:$PATH"

# flutter
export PATH="$PATH:$HOME/flutter/bin"

# thefuck
eval $(thefuck --alias)
