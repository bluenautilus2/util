#!/usr/bin/env python3

import boto3
import subprocess
import pprint
import json

#subprocess.check_output(["aws", "sso", "login", "--profile", "int-perf"])

sqs_creds = subprocess.check_output(["aws", "sts", "assume-role", "--role-arn", "arn:aws:iam::842979524102:role/awo-sqs-assume-role", "--role-session-name", "sqs-role", "--profile", "int-perf"])
data = json.loads(sqs_creds)

s3_client = boto3.client(
    's3',
    region_name="us-west-2",
    aws_access_key_id=data["Credentials"]["AccessKeyId"],
    aws_secret_access_key=data["Credentials"]["SecretAccessKey"],
    aws_session_token=data["Credentials"]["SessionToken"]
)

upload_bucket_name = 'awo-perf-test-upload-usw2'
prefix = 'currently_processing'
file_name = '/Users/bstevens/dev/ai-writing-orchestration/tools/add-to-sqs-queue/massive-sample-2016-to-2019-submission-ids.txt'

objects_to_delete = []

# Get the list of objects with the specified prefix
response = s3_client.list_objects_v2(Bucket=upload_bucket_name, Prefix=prefix)
if 'Contents' in response:
    for content in response['Contents']:
        objects_to_delete.append({'Key': content['Key']})

    # Delete the objects
if objects_to_delete:
    s3_client.delete_objects(Bucket=upload_bucket_name, Delete={'Objects': objects_to_delete})
    print(f"Deleted {len(objects_to_delete)} objects with prefix '{prefix}' from bucket '{upload_bucket_name}'")
else:
    print(f"No objects found with prefix '{prefix}' in bucket '{upload_bucket_name}'")

