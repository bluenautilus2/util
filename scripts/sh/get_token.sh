#!/bin/bash          

TOKEN=`curl -s https://applevac-qa.algagent.com/cq/services/initialize` 
TOKEN=`echo $TOKEN | sed  's/\"//g'`
echo $TOKEN

