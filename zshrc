# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM="$HOME/.oh-my-zsh-custom"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(fzf direnv z personal tmux colored-man-pages work gcp kubectl terraform git git-open)

source $ZSH/oh-my-zsh.sh

## User configuration

# add poetry bin to PATH
export PATH="/Users/arunvelsriram/.local/bin:$PATH"

# homebrew's sbin
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/go@1.14/bin:$PATH"

# go bins
export PATH="$PATH:$(go env GOPATH)/bin"

# goland
export PATH="/Applications/GoLand.app/Contents/MacOS:$PATH"

# cargo bins
export PATH="$HOME/.cargo/bin:$PATH"

# pipx bins
export PATH="$HOME/.local/bin:$PATH"

# ssh add identities
ssh-add -L &>/dev/null || ssh-add -q --apple-use-keychain $(rg -l PRIVATE ~/.ssh | xargs)

# suppress direnv output
export DIRENV_LOG_FORMAT=

# autocompletions
## gcloud
source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"
## kubectl
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)
compdef kubecolor=kubectl

## helm
source <(helm completion zsh)
## hostctl
source <(hostctl completion zsh)

# syntax highlighting
## needs to be at the end
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# gpg passphrase
export GPG_TTY=$(tty)

# docker build progress
export BUILDKIT_PROGRESS=plain

# fzf
export FZF_DEFAULT_OPTS='--height=20 --ansi --reverse --border=bold --info=inline --height=25%'

# mise
eval "$(/opt/homebrew/bin/mise activate zsh)"


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/arunvelsrirams/.lmstudio/bin"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/arunvelsrirams/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
