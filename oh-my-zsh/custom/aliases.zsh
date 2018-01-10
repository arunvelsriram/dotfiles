# Vim
alias vimr='vimr -s'

# Git
alias g='git'
alias gst='git status'
alias gpl='git pull'
alias gplr='git pull --rebase'
alias gps='git push'
alias gco='git checkout'
alias gbr='git branch'
alias gd='git diff'
alias gds='git diff --staged'
alias gci='git commit'
alias gcim='git commit -m'
alias gad='git add'
alias gadp='git add -p'
alias gsts='git stash'
alias gstsp='git stash pop'
alias gstsa='git stash apply'
alias glg='git log'
alias glgp='git log --pretty=format:"%C(yellow)%h %Cred%ad %Cblue%an%Cgreen%d %Creset%s" --date=short'

# Tig
alias t='tig'

# Vagrant
alias v='vagrant'
alias vst='vagrant status'
alias vup='vagrant up'
alias vpr='vagrant provision'
alias vhlt='vagrant halt'
alias vdy='vagrant destroy'

# Edit Configs
alias zshconfig='nvim ~/.zshrc'
alias nvimconfig='nvim ~/.config/nvim/init.vim'

# highlight
alias cat='highlight -O ansi --force'

# kubectl
alias k='kubectl'
alias kl='kubectl logs'
alias klf='kubectl logs -f'

alias kd='kubectl describe'
alias kdj='kubectl describe job'

# kubectx
alias kx='kubectx'

# kubens
alias kns='kubens'
