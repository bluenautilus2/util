#!/usr/bin/env python3

import boto3
import subprocess
import pprint
import json

#subprocess.check_output(["aws", "sso", "login", "--profile", "int-perf"])

sqs_creds = subprocess.check_output(["aws", "sts", "assume-role", "--role-arn", "arn:aws:iam::842979524102:role/awo-sqs-assume-role", "--role-session-name", "sqs-role", "--profile", "int-perf"])
data = json.loads(sqs_creds)

client = boto3.client(
    'sqs',
    region_name="us-west-2",
    aws_access_key_id=data["Credentials"]["AccessKeyId"],
    aws_secret_access_key=data["Credentials"]["SecretAccessKey"],
    aws_session_token=data["Credentials"]["SessionToken"]
)

messageBody = """
{"submission_id": "oid:1:650430144",
    "metadata": {
        "char_count": 2628,
        "word_count": 400,
        "page_count": 0,
        "mimetype": "application/pdf",
        "filename": "oid-2956-108618187.pdf",
        "filesize": 81580,
        "language": "en",
        "image_dimensions": null,
        "ingest_request_time": "2023-04-21T17:03:56Z",
        "ingest_complete_time": "2023-04-21T17:03:57Z",
        "delete_time": null,
        "status": 3,
        "error_code": 0,
        "error_desc": null,
        "quote_percentage": 5.577,
        "bibliography_percentage": 0,
        "stopwords_percentage": 44.423077,
        "stopwords_window_percentage": 37.5,
        "tenant": "collegeboard",
        "provider": "tca",
        "md5": "0b375f5963b018a3ccefd1b7b56196f2",
        "data_blob": "{\\"uploadType\\":\\"Submission\\",\\"source\\":\\"import\\",\\"submissionId\\":\\"57d19e38-5dac-471d-824b-43110a3b6ab8\\",\\"aiwritingEnabled\\":true}",
        "callback_attributes": "{\\"source\\":\\"import\\",\\"submission_id\\":\\"57d19e38-5dac-471d-824b-43110a3b6ab8\\",\\"upload_type\\":\\"Submission\\",\\"is_import\\":\\"true\\"}"
    },
    "assets": {
        "original": "/submission/oid:12153:225542502/original",
        "repository": "/submission/oid:12153:225542502/repository",
        "images": null,
        "glyph": null,
        "pdf": null,
        "image_metadata": null
    }}"""

response = client.send_message(
    QueueUrl="https://sqs.us-west-2.amazonaws.com/842979524102/awo-perf-PandaNotificationSQSQueue-usw2",
    MessageBody=messageBody,
    DelaySeconds=0,
)

print("Response from SQS: \n")
pprint.pprint(response)
