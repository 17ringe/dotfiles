#!/bin/sh

if [ ! -d /usr/local/bin ]; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew -v
else
  echo "Homebrew is already installed."
fi
