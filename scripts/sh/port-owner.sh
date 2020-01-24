#!/bin/sh
echo 'usage: port-owner <port>'
echo 

lsof -nP -i4TCP:$1 | grep LISTEN
