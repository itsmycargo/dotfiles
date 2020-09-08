#!/bin/bash

git_email=$(git config --global user.email)
echo $git_email
if ! echo $git_email | grep -q itsmycargo; then
  echo "GIT Configuration"
  read -p "Your Full Name: " git_user
  read -p "Your Work Email: " git_email

  git config --global user.name "${git_user}"
  git config --global user.email "${git_email}"
fi
