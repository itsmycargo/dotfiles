#!/bin/sh

# Install and configure AWS
if [ -z "$(command -v aws-rotate-iam-keys)" ];
then
  /opt/homebrew/bin/brew tap rhyeal/aws-rotate-iam-keys https://github.com/rhyeal/aws-rotate-iam-keys
  /opt/homebrew/bin/brew install awscli aws-rotate-iam-keys
  brew services start aws-rotate-iam-keys
fi

if [ ! -f "${DOTFILES_ROOT}/local/aws/credentials" ]; then
  mkdir -p "${DOTFILES_ROOT}/local/aws"
  touch "${DOTFILES_ROOT}/local/aws/credentials"
fi
