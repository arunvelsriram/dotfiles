# asdf
source /usr/local/opt/asdf/asdf.sh

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Postgres
export POSTGRES_PATH="/Applications/Postgres.app/Contents/Versions/latest"
export PATH=$PATH:$POSTGRES_PATH/bin

# Golang
export GOPATH=$(go env GOPATH)
export PATH=$PATH:$GOPATH/bin

# Java
export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"

# Android
export ANDROID_HOME="/usr/local/share/android-sdk"

# direnv hook
eval "$(direnv hook bash)"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# kube-fzf
[ -f ~/.kube-fzf/kube-fzf.sh ] && source ~/.kube-fzf/kube-fzf.sh

# cargo
export PATH="$HOME/.cargo/bin:$PATH"

# node
export PATH="/usr/local/opt/node@8/bin:$PATH"

# kube-ps1
export KUBE_PS1_PREFIX='['
export KUBE_PS1_SUFFIX=']'
source ~/.kube-ps1/kube-ps1.sh
PROMPT=$PROMPT'$(kube_ps1) '

# lazy-connect
[ -f ~/.lazy-connect/lazy-connect.sh ] && source ~/.lazy-connect/lazy-connect.sh
