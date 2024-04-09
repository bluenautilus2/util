#!/bin/bash


# to use this script, type  > cat input_file.json | parameterize_json.sh  >  output.txt

# Read all input into a variable
input="$(cat)"

# Remove all newlines and put everything on one line
input=$(echo "$input" | tr -d '\n')

# Remove all whitespace
input=$(echo "$input" | tr -d '[:space:]')

# Replace all " with \"
input=$(echo "$input" | sed 's/"/\\"/g')

# Output the result
echo "$input"
