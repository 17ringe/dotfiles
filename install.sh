#!/bin/sh

if [ ! -d /usr/local/bin ]; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew -v
else
  echo "Homebrew is already installed."
fi

if [ ! -f /usr/local/bin/ansible ]; then
  brew bundle --file=Brewfile-init
  brew list
else
  echo "Ansible is already installed."
fi
