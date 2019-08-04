# Postgres
export POSTGRES_PATH="/Applications/Postgres.app/Contents/Versions/latest"
export PATH=$PATH:$POSTGRES_PATH/bin

# golang
export PATH=$(go env GOPATH)/bin:$PATH

# Locales
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Increase bash history
export HISTSIZE=-1
export HISTFILESIZE=-1

# added by travis gem
[ -f /Users/arunvelsriram/.travis/travis.sh ] && source /Users/arunvelsriram/.travis/travis.sh

# bash completion
export BASH_COMPLETION_COMPAT_DIR=/usr/local/etc/bash_completion.d
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

#AWSume alias to source the AWSume script
alias awsume=". awsume"

#Auto-Complete function for AWSume

_awsume() {
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    opts=$(awsumepy --rolesusers)
    COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
    return 0
}
complete -F _awsume awsume

