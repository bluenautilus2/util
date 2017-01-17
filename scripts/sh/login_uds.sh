#!/bin/bash          

TOKEN=$1

JSON=`curl -H "Content-Type: application/json" -H "Authorization: $TOKEN" -d "{ \"username\":\"nshah2@email.com\", \"password\":\"Password1\", \"brandId\":1, \"industryId\":\"00016785\" }" -i  http://localhost:9080/user/rest/UserService/agentlogin`

echo $JSON


