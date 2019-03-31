# Postgres
export POSTGRES_PATH="/Applications/Postgres.app/Contents/Versions/latest"
export PATH=$PATH:$POSTGRES_PATH/bin

# Java
export JAVA_HOME="$(/usr/libexec/java_home)"

# Android
export ANDROID_HOME="/usr/local/share/android-sdk"
export PATH=$ANDROID_HOME/tools:$PATH

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

export BASH_COMPLETION_COMPAT_DIR=/usr/local/etc/bash_completion.d
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
