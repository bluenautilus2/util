#!/usr/bin/env python

import sys
import re
import os.path

def die(error_message):
	print(error_message)
	sys.exit(1)

#returns true if one and only one value is set 
def xor(flag1, flag2, flag3):
	if not (flag1 or flag2 or flag3):
		return False 
	if (flag1 and flag2)or(flag1 and flag3)or(flag2 and flag3):
		return False 
	return True 
		

if(len(sys.argv)>1):
	script_file_name=sys.argv[1]
else:
	die('Usage: checkDBNames <script_file_name>.\n Run this in the same folder that the script is in, and pass in only the name of the script.')
script_file_name=script_file_name.strip()

date = script_file_name.split('_')[0]
secondHalf = script_file_name.split('_')[1]
timestamp = secondHalf.split('.')[0]
ext=secondHalf.split('.')[1]

ex= 'There was a problem parsing your script Filename. Found the following: Delivery date: '+date+ ' Timestamp: '+ timestamp+ ' Extension: '+ ext + '\n. Name should have this format: YYYY-MM-DD_eeeeeeeeee.sql  where "e" is the current epoch\n'
if date=='' or secondHalf=='':
	die(ex + ' You need to separate the delivery date and timestamp with an underscore _ ') 

if re.match('201\d{1}-\d{2}-\d{2}$', date, flags=0)==None:
	die(ex + ' Your delivery date string is malformed')
if re.match('\d{10}',timestamp,flags=0)==None:
	die(ex + ' Timestamp must be 10 characters long. Did you use UTC Epoch?')
if not ext=='sql':
	die(ex + ' Script must end in .sql')

if not os.path.isfile(script_file_name):
	die(' File not found: ' + script_file_name + '. Run this script in the same folder the file is in. Pass in only the name of the script. (not the full path) ')

rollback_file_name = 'rollback/'+date+'_'+timestamp+'_rollback.'+ext
print('Looking for rollback.. '+rollback_file_name)
if not os.path.isfile(rollback_file_name):
	die(' No rollback script found. You must write one, even if it is empty.')

#Scan first thousand bytes of script for required tags
typeLine=''
targetLine=''
planLine=''

fh=open(script_file_name,'r')
lines = fh.readlines(1000)
for line in lines:
	if re.search('TYPE:',line,re.I)!=None:
		typeLine = line

	if re.search('TARGET:',line,re.I)!=None:
		targetLine = line

	if re.search('EXECUTION_PLAN:',line,re.I)!=None:
		planLine = line
fh.close()
ex = 'There was a problem parsing the tags in the header of your script. ' 

#---------type
if typeLine=='':
	die(ex + 'You must include a TYPE: in the first 30 lines of the header. (Type must be either DDL or DML)')

if re.search('DDL|DML',typeLine,re.I)==None:
	die(ex + 'TYPE: must be DDL or DML')
if re.search('DDL.*DML|DML.*DDL',typeLine, re.I)!=None:
	die(ex + 'TYPE: must be DDL or DML but not both. Pick one.')

#---------target
if targetLine=='':
	die(ex + 'You must include a TARGET: in the first 30 lines of the header. (Target is one and only one of these: POD_MAIN, COMMON, POD_LOGGING)')

mainFlag = re.search('POD_MAIN',targetLine,re.I)!=None
commonFlag = re.search('COMMON',targetLine,re.I)!=None
logFlag = re.search('POD_LOGGING',targetLine,re.I)!=None
if not xor(mainFlag,commonFlag,logFlag):
	die('TARGET: must be one and only one of these: POD_MAIN, COMMON, or POD_LOGGING')

#---------plan
if planLine=='':
	die(ex + 'You must include an EXECUTION_PLAN: in the first 30 lines of the header. (Plan must be one and only one of these: PRE-DEPLOYMENT, POST-DEPLOYMENT, OUTAGE)')
preFlag = re.search('PRE-DEPLOYMENT',planLine,re.I)!=None
postFlag = re.search('POST-DEPLOYMENT',planLine,re.I)!=None
outFlag = re.search('OUTAGE',planLine,re.I)!=None
if not xor(preFlag,postFlag,outFlag):
	die(ex + 'EXECUTION_PLAN must be set to one and only one of these: PRE-DEPLOYMENT, POST-DEPLOYMENT, or OUTAGE')

#Scan entire script for the update call
fh=open(script_file_name,'r')
for line in fh:
	if re.search('addDBUpdate',line,flags=0)!=None:
		updateLine=line	
if updateLine=='':
	die('You must include a call to the addDBUpdate procedure near the end of your script')
updateParam=date+'_'+timestamp
if re.search(updateParam,updateLine,flags=0)==None:
	die('The parameter you passed to addDBUpdate doesn\'t match your filename. Was expecting '+updateParam+' somewhere on this line: '+updateLine+'')
if re.search('sql',updateLine,re.I)!=None:
	die('Your parameter to addDBUpdate is invalid. Do not include \'.sql\' Only include '+ updateParam+'')

print('==Script check complete. '+script_file_name+' is valid!==')
sys.exit(0)

