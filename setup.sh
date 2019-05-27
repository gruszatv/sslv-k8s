#!/usr/bin/env bash

# HomeBrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install git
# iTerm2 ZSh PowerLevel9
# https://medium.freecodecamp.org/how-you-can-style-your-terminal-like-medium-freecodecamp-or-any-way-you-want-f499234d48bc
brew cask install iterm2
brew install zsh
# Open Iterm2  chsh -s /bin/zsh
# https://iterm2colorschemes.com/


# https://github.com/kubernetes/minikube/blob/master/docs/drivers.md
# https://kubernetes.io/docs/tasks/tools/install-minikube/#install-a-hypervisor
# Install kubernetes kubectl, minikube
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x ./kubectl
brew cask install minikube
minikube config set vm-driver hyperkit
# Minikube installation
brew install hyperkit
minikube start
kubectl version