 #!/bin/bash          

aws sso login --profile int-dev 

OUT=$(aws sts assume-role --role-arn  arn:aws:iam::842979524102:role/awo-sqs-assume-role --role-session-name sqs-role --profile int-dev)

export AWS_ACCESS_KEY_ID=$(echo $OUT | jq -r '.Credentials''.AccessKeyId');\
export AWS_SECRET_ACCESS_KEY=$(echo $OUT | jq -r '.Credentials''.SecretAccessKey');\
export AWS_SESSION_TOKEN=$(echo $OUT | jq -r '.Credentials''.SessionToken');

aws sqs send-message  --queue-url https://sqs.us-west-2.amazonaws.com/842979524102/awo-perf-PandaNotificationSQSQueue-usw2 --message-body  "test"
