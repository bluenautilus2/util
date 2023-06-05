#!/bin/bash

PROFILE_NAME=$1

aws sso login --profile $PROFILE_NAME
export AWS_DEFAULT_PROFILE=$PROFILE_NAME

CREDS_FILE=$(aws configure list --profile $PROFILE_NAME | grep access_key | awk '{print $2}' | tail -c 5 | xargs -I "{}" grep -l "{}" ~/.aws/cli/cache/*)

export AWS_ACCESS_KEY_ID=$(jq -r '.Credentials.AccessKeyId' $CREDS_FILE)
export AWS_SECRET_ACCESS_KEY=$(jq -r '.Credentials.SecretAccessKey' $CREDS_FILE)
export AWS_SESSION_TOKEN=$(jq -r '.Credentials.SessionToken' $CREDS_FILE)
