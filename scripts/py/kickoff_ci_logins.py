#!/usr/bin/python

import thread
import time
import subprocess
import threading
import sys

tokenString = subprocess.Popen('/Users/estevens/dev/scripts/scripts/sh/get_token.sh', shell=True, stdout=subprocess.PIPE).stdout.read()
tokenString = tokenString.strip()



loginString = 'curl -sH \"Content-Type: application/json\" -H \"Authorization: '\
              + tokenString + '\" -d \'{ \"username\":\"estevens2@applelg.net\", \"password\":\"Password1\", \"brandId\":1, \"industryId\":\"00016785\" }\''\
              +' -i  http://uds-ci-app-user.appleleisuregroup.com/user/rest/UserService/agentlogin'

#print 'Created Command: ' + loginString + '\n'

def run_for_it():
    timestart = time.time()
    processObj = subprocess.Popen(loginString, shell=True, stdout=subprocess.PIPE)
    std_out_string = processObj.stdout.read()
    #print 'PARSING: ' + std_out_string + '\n\n\n'
    token_index = std_out_string.find('"token"')
    #print 'TOKEN: ' + str(token_index)
    user_token = std_out_string[token_index + 11:token_index + 47]
    #print 'PARSED: ' + user_token
    timeend = time.time()
    sys.stdout.write('TS: ' +  'UNIQUE TOKEN: ' + user_token + ' SECONDS: ' + str((timeend - timestart)) + '\n')

for outer in range(0,5):
    time.sleep(0.5)
    for x in range(0,10):
        t = threading.Thread(target=run_for_it, args=())
        t.start()

#f = open('run_results.txt', 'a')
#f.write('berf')
#f.close()


