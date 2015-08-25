#!/usr/bin/env python

import datetime
import time
import sys

#takes a datetime
def next_thursday(daygiven):
    days_ahead = 3 - daygiven.weekday()
    if days_ahead < 0: # Target day already happened this week
        days_ahead += 14
    else:
        days_ahead += 7
    return daygiven + datetime.timedelta(days_ahead)


today = datetime.date.today()
deliveryDay = next_thursday(today) #deliveryDay is datetime obj

dateOnlyString = str(deliveryDay.year) + '-{:0>2d}'.format(deliveryDay.month) + '-{:0>2d}'.format(deliveryDay.day)
epoch = int(time.time()) #utc
dateString = dateOnlyString + '_' + str(epoch)


print 'Next delivery: ' + dateOnlyString
print 'Cassandra? Hit Y, or just enter to continue as Sql-->',

data = sys.stdin.readline()
answer = str(data).strip()
if answer == 'y' or answer == 'Y':
    cass = True
else:
    cass = False

fileString = dateString + ('.cql' if cass else '.sql')

fh = open(fileString, 'w')

fh.write('-- ' + fileString + '\n')
fh.write('--\n')
fh.write('-- PA-123456 Jira Title Here\n')
fh.write('--\n')
fh.write('-- Brief Description of what this script does\n')
fh.write('--\n')
fh.write('-- TYPE: DDL/DML\n')
if not cass:
    fh.write('--\n')
    fh.write('-- TARGET: POD_MAIN/COMMON/POD_LOGGING\n')

fh.write('--\n')
fh.write('-- EXECUTION_PLAN: PRE-DEPLOYMENT/POST-DEPLOYMENT/OUTAGE\n')
fh.write('--\n')
fh.write('-- AUTHOR: First Last (youremail@infor.com) \n')
fh.write('--\n')
fh.write('\n')
if cass:
    fh.write('use pa;\n')
fh.write('\n')

if not cass:
    fh.write("EXEC addDBUpdate N'" + dateString + "'\n")
else:
    fh.write('INSERT INTO cql_script_executions (year, tag, last_date_applied) VALUES (' + str(today.year)+", '" + dateString + "', DATEOF(NOW()));\n")

fh.close

rollbackFileString = dateString + '_rollback.sql'
if cass:
    rollbackFileString = dateString + '_rollback.cql'

rh = open(rollbackFileString, 'w')

rh.write('--\n')
rh.write('-- Rollback for Script ' + fileString + '\n')
rh.write('--\n')
rh.write('-- AUTHOR: First Last (youremail@infor.com) \n')
rh.write('--\n')
rh.write('\n')
if cass:
    rh.write('use pa;\n')
rh.write('\n')

if not cass:
    rh.write("EXEC addDBUpdate N'" + dateString + "_rollback'\n")
else:
    rh.write('INSERT INTO cql_script_executions (year, tag, last_date_applied) VALUES (' + str(today.year) + ", '" + dateString + "_rollback', DATEOF(NOW()));\n")
rh.close()

print fileString + ' and ' + rollbackFileString + ' generated in the current folder.'
