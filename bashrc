# asdf
source /usr/local/opt/asdf/asdf.sh

# Postgres
export POSTGRES_PATH="/Applications/Postgres.app/Contents/Versions/latest"
export PATH=$PATH:$POSTGRES_PATH/bin

# Java
export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"

# Android
export ANDROID_HOME="/usr/local/share/android-sdk"

# kube-fzf
[ -f ~/.kube-fzf/kube-fzf.sh ] && source ~/.kube-fzf/kube-fzf.sh

# cargo
export PATH="$HOME/.cargo/bin:$PATH"

# node
export PATH="/usr/local/opt/node@8/bin:$PATH"

# lazy-connect
[ -f ~/.lazy-connect/lazy-connect.sh ] && source ~/.lazy-connect/lazy-connect.sh
