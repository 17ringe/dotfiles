#!/bin/sh

finder=$(defaults read com.apple.finder AppleShowAllFiles)

if [ ! $? == 0 ] || [ $finder == false ]; then
  defaults write com.apple.finder AppleShowAllFiles true
  killall Finder
else
  echo "Hidden files are already displayed."
fi

if [ ! -d /usr/local/bin ]; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "Homebrew is already installed."
fi

if [ ! -f /usr/local/bin/ansible ]; then
  brew install pkg-config ansible mas
  brew cask install insomniax
  ansible-galaxy install pipersniper.macos_installer
else
  echo "Ansible is already installed."
fi

if [ ! -f /usr/local/bin/rcup ]; then
  brew tap thoughtbot/formulae
  brew install rcm
  chmod +x ./hooks/post-up
  env RCRC=~/.dotfiles/rcrc rcup
else
  echo "RCM is already installed."
fi

if [ ! -f ~/.anyenv/bin/anyenv ]; then
  git clone https://github.com/riywo/anyenv ~/.anyenv
  mkdir ~/.anyenv/plugins
  git clone https://github.com/znz/anyenv-update ~/.anyenv/plugins/anyenv-update
  source ~/.bash_profile
else
  echo "Anyenv is already installed."
fi

if [ ! -f ~/.anyenv/envs/rbenv/bin/rbenv ]; then
  anyenv install rbenv
  source ~/.bash_profile
  rbenv install 2.4.1
  rbenv global 2.4.1
  rbenv rehash
else
  echo "Rbenv is already installed."
fi

if [ ! -f ~/.anyenv/envs/ndenv/bin/ndenv ]; then
  anyenv install ndenv
  source ~/.bash_profile
  ndenv install v8.9.4
  ndenv global v8.9.4
  ndenv rehash
else
  echo "Ndenv is already installed."
fi
