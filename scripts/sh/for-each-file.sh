#!/bin/bash

# Get a list of all files in the current directory
files=$(ls)

# Iterate over the list of files and print out each filename
for file in $files
do
  echo $file
  curl --location 'https://internal.turnitin.dev/sms-namespace/seu/sms-serviceName/panda/submission' \
  --form 'file=@"/Users/bstevens/Desktop/ai_writing/star-wars-ai/SWSAGA-Order 66.pdf"' \
  --form 'nodeid="1"' \
  --form 'link_text="https://turnitin.org/java.pdf"' \
  --form 'tenant="tii-acorn-uscald"' \
  --form 'provider="acorn"'
done


