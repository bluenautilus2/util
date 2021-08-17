#!/bin/bash
 for i in {468003..469001}
   do
	   echo $i
	   echo
     curl --location --request DELETE 'https://phx001-api-dev.codehaus.es/v1/users/delete' \
     --header 'Content-Type: application/json' \
     --header 'authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ0aWVyMXN1cHBvcnRAZXhhbXNvZnR0ZXN0LmNvbSIsIlVzZXJJZCI6MTU1LCJJbnN0aXR1dGlvbklkIjozMDIsIlN1cHBvcnRVc2VyIjp0cnVlLCJpYXQiOjE2MTE3NzQyNzAsImV4cCI6MTYxMTg2MDY3MH0.rBcOQ_KbH2Cf5tWcYsHaI6oPDuQKQOY0Q9Zda9rHY6M' \
     --data-raw '{
          "userIds": ['$i']
     }'
     echo
  done
