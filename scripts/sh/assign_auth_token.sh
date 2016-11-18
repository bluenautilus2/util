#!/bin/bash          

TOKEN=`curl https://applevac-ci.algagent.com/cq/services/initialize`
TOKEN=`echo $TOKEN | sed  's/\"//g'`
echo $TOKEN
echo 
echo 
curl -H "Content-Type: application/json" -H "Authorization: $TOKEN" -d "{ \"username\":\"nshah2@email.com\", \"password\":\"Password1\", \"brandId\":1, \"industryId\":\"00016785\" }"  http://localhost:9080/user/rest/UserService/agentlogin 


#http://127.0.0.1:8124/


