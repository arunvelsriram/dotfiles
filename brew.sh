#!/bin/bash

install_brew() {
  type brew || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

brew_packages() {
  brew install antigen
  brew install neovim
  brew install ansible
  brew install direnv
  brew install tig
  brew install nmap
  brew install asdf
  brew install httpie
  brew install graphviz
  brew install tmux
  brew install golang
  brew install glide
  brew install jq
  brew install aria2
  brew install ag

  brew install fzf
  /usr/local/opt/fzf/install --key-bindings --completion --no-update-rc

  brew install nvm
  mkdir -p ~/.nvm

  # Homebrew-Cask
  brew tap caskroom/cask
  brew cask install firefox-beta
  brew cask install iterm2
  brew cask install visual-studio-code
  brew cask install google-chrome
  brew cask install ngrok
  brew cask install docker
  brew cask install flux
  brew cask install keeweb
  brew cask install dropbox
  brew cask install slack
  brew cask install spectacle
  brew cask install caffeine
  brew cask install openoffice
  brew cask install vagrant
  brew cask install vagrant-manager
  brew cask install rowanj-gitx
  brew cask install vlc
  brew cask install clipy
  brew cask install google-cloud-sdk
  brew cask install kindle
  brew cask install postman
  brew cask install etcher
  brew cask install minikube
  brew cask install vimr

  brew tap caskroom/fonts
  brew cask install font-fira-code
}
