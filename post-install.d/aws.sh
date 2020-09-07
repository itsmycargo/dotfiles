#!/bin/bash

echo "AWS Credentials"
echo "Visit https://console.aws.amazon.com/iam/home?region=eu-central-1#/security_credentials"
echo ""
echo -n "AWS Access Key ID: "
read -r aws_access_key_id
echo -n "AWS Secret Access Key: "
read -r aws_secret_access_key

/usr/local/bin/aws configure set aws_access_key_id "${aws_access_key_id}"
/usr/local/bin/aws configure set aws_secret_access_key "${aws_secret_access_key}"
/usr/local/bin/aws configure set default.region eu-central-1
