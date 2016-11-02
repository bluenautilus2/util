#!/usr/bin/env python

import os
import time
import sys

print 'Please give the database name:>'
database_name = str(sys.argv[1])
print 'using database name ' + database_name


def visit_all_files(path):
    torun = []

    for dirname, dirnames, filenames in os.walk(path):

        # print path to all filenames.
        for filename in filenames:
            if filename.endswith('.sql'):
                # print(os.path.join(dirname, filename))
                torun.append(os.path.join(dirname, filename))
    return torun


# main program

run_files = visit_all_files('.')
run_files.sort()
print 'Found ' + str(len(run_files))

for sql_file in run_files:
    var = raw_input('Run ' + sql_file + "? <enter to run, s to skip or q to quit-->")
    if (var!='q') and (var!='s'):
        os.system("psql -U postgres -h localhost -d " + database_name + " -f " + sql_file)
    if(var=='q'):
        sys.exit(1)

