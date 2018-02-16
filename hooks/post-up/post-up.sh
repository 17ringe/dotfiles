#!/bin/sh

array=(
  "package.json"
  "composer.json"
  "playbook.yml"
  "hosts"
  "Brewfile"
  "Gemfile"
)

for item in ${array[@]}; do
  if [ -f $HOME/.$item ]; then
    mv $HOME/.$item $HOME/$item
  fi
done
