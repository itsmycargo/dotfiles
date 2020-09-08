#!/bin/bash

if [ -z "$(/usr/local/bin/aws configure get aws_access_key_id)" ]; then
  echo "AWS Credentials"
  echo "Visit https://console.aws.amazon.com/iam/home?region=eu-central-1#/security_credentials"
  echo ""
  read -p "Access Key ID: " aws_access_key_id
  read -p "Secret Access Key: " aws_secret_access_key

  /usr/local/bin/aws configure set aws_access_key_id "${aws_access_key_id}"
  /usr/local/bin/aws configure set aws_secret_access_key "${aws_secret_access_key}"
  /usr/local/bin/aws configure set default.region eu-central-1
fi
