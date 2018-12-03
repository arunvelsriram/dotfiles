# asdf
source /usr/local/opt/asdf/asdf.sh

# Postgres
export POSTGRES_PATH="/Applications/Postgres.app/Contents/Versions/latest"
export PATH=$PATH:$POSTGRES_PATH/bin

# Java
export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"

# Android
export ANDROID_HOME="/usr/local/share/android-sdk"
export PATH=$ANDROID_HOME/tools:$PATH

# cargo
export PATH="$HOME/.cargo/bin:$PATH"

# Kubectl shell completion
source '/Users/arunvelsriram/.kube/completion.bash.inc'

# Locales
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Increase bash history
export HISTSIZE=-1
export HISTFILESIZE=-1

# added by travis gem
[ -f /Users/arunvelsriram/.travis/travis.sh ] && source /Users/arunvelsriram/.travis/travis.sh

complete -C /usr/local/Cellar/terraform/0.11.8/bin/terraform terraform
