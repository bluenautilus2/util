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
key = 'test/test-errors.txt'
file_name = '/Users/bstevens/Desktop/perf-100.txt'
#file_name = '/Users/bstevens/Desktop/dev_20_test.txt'
s3_client.upload_file(file_name, upload_bucket_name, key)
