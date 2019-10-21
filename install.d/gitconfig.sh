#!/bin/sh

echo "GIT Configuration"
echo "Your Full Name: "
read -r git_user
echo "Your Work Email:"
read -r git_email

git config --global user.name "${git_user}"
git config --global user.email "${git_email}"
