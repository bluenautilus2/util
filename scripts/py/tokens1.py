#/usr/bin/env python

import sys
import subprocess



tokenString = subprocess.Popen("curl https://applevac-ci.algagent.com/cq/services/initialize", shell=True, stdout=subprocess.PIPE).stdout.read()



z40='0000000000000000000000000000000000000000'
no_input='Pre-push hook: no input'
stdin = sys.stdin.readline()
if stdin==None or stdin=="":
	print(no_input)
	sys.exit(0)

inputArray = stdin.split()
if len(inputArray)==0:
	print(no_input)
	sys.exit(0) 

local_sha=inputArray[1]
remote_sha=inputArray[3]

if remote_sha==z40:
	range=local_sha
else:
	range=remote_sha + ".." + local_sha

print("Pre-push hook: range of commits being checked: " +range)

topLevel = subprocess.Popen("git rev-parse --show-toplevel", shell=True, stdout=subprocess.PIPE).stdout.read()
oneline = subprocess.Popen("git diff-tree --diff-filter AMXB --no-commit-id --name-only -r " + range, shell=True, stdout=subprocess.PIPE).stdout.read()

sys.exit(0)
