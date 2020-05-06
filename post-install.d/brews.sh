#!/bin/bash

set -e

# Install Brews
echo "--> Installing Brews"
shopt -s nullglob
for brewfile in "${DOTFILES_ROOT}"/{itsmycargo,local}/Brewfile;
do
  [ -e "${brewfile}" ] && $(command -v brew) bundle install --file="${brewfile}"
done
shopt -u nullglob
