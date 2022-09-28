#!/bin/bash

if [ -z "$(aws configure get aws_access_key_id)" ]; then
  echo "AWS Credentials"
  echo "Visit https://console.aws.amazon.com/iam/home?region=eu-central-1#/security_credentials"
  echo ""
  read -p "Access Key ID: " aws_access_key_id
  echo "Secret Access Key: "
  read -s aws_secret_access_key

  aws configure set aws_access_key_id "${aws_access_key_id}"
  aws configure set aws_secret_access_key "${aws_secret_access_key}"
  aws configure set default.region eu-central-1
fi

# Ensure Docker Credentials
if ! grep -q "ecr-login" ~/.docker/config.json;
then
  mkdir -p ~/.docker
  if [ ! -e ~/.docker/config.json ];
  then
    echo '{}' > ~/.docker/config.json
  fi

  brew install jq docker-credential-helper-ecr

  jq \
    '. + {"credsHelpers": {"003688427525.dkr.ecr.eu-central-1.amazonaws.com": "ecr-login"}}' \
    ~/.docker/config.json > ".$$"
  mv ".$$" ~/.docker/config.json
fi
