#!/bin/sh

echo "type you command here"
if [ $? -eq 0 ]; then
    echo OK
else
    echo FAIL
fi
