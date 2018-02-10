#!/bin/sh

finder=`defaults read com.apple.finder AppleShowAllFiles`

if [ ! $? = 0 ] || [ $finder == false ]; then
  defaults write com.apple.finder AppleShowAllFiles true
  killall Finder
else
  echo "Hidden files are already displayed."
fi

if [ ! -d /usr/local/bin ]; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew -v
else
  echo "Homebrew is already installed."
fi

if [ ! -f /usr/local/bin/ansible ]; then
  brew install pkg-config libyaml openssl python ansible
  brew list
else
  echo "Ansible is already installed."
fi
