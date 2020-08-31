#!/bin/sh

[ -f "${DOTFILES_ROOT}/local/aws/credentials" ] && exit 0

# Install and configure AWS
/usr/local/bin/brew tap rhyeal/aws-rotate-iam-keys https://github.com/rhyeal/aws-rotate-iam-keys
/usr/local/bin/brew install awscli aws-rotate-iam-keys
brew services start aws-rotate-iam-keys

mkdir -p "${DOTFILES_ROOT}/local/aws"
touch "${DOTFILES_ROOT}/local/aws/credentials"
