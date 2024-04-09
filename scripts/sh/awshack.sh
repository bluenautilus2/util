#!/bin/bash

PROFILE_NAME=$1
CREDENTIALS_NAME=$2

CREDS_FILE=$(aws configure list --profile $PROFILE_NAME | grep access_key | awk '{print $2}' | tail -c 5 | xargs -I "{}" grep -l "{}" ~/.aws/cli/cache/*)
aws configure set aws_access_key_id $(jq -r '.Credentials.AccessKeyId' $CREDS_FILE) --profile $CREDENTIALS_NAME
aws configure set aws_secret_access_key $(jq -r '.Credentials.SecretAccessKey' $CREDS_FILE) --profile $CREDENTIALS_NAME
aws configure set aws_session_token $(jq -r '.Credentials.SessionToken' $CREDS_FILE) --profile $CREDENTIALS_NAME
