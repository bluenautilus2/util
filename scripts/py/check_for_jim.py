#!/usr/bin/env python

import os
import sys
import time

print 'Usage: ' + sys.argv[0] + ' <full path to old File> <full path to new File> \n'

if 3 > len(sys.argv):
	print 'Please pass two parameters'
	sys.exit()

old_file = sys.argv[1]
new_file = sys.argv[2]

if bool(old_file):
	print 'using old file: ' + old_file + ' and new file ' + new_file


# functions


def get_keys_and_values(full_filename):
	if not os.path.exists(full_filename):
		return {}
	fh = open(full_filename, 'r')
	lines = fh.readlines()
	map_to_return = {}
	for line in lines:
		index = line.find('=')
		if not line.startswith('#') and index != -1 and not line.startswith('error.characteristic'):
			map_to_return[line[:index]] = line[index + 1:-1]
	return map_to_return


# main program

output_dir = os.path.join(os.path.realpath('.'), str(int(time.time())))
os.mkdir(output_dir)


old_map = get_keys_and_values(old_file)
new_map = get_keys_and_values(new_file)
consolidated_map = {}


newfile = os.path.join(output_dir, 'check_for_jim.txt')
fh = open(newfile, 'w')


for old_key in old_map:
	if 'assessment' in old_key:
		old_value = old_map[old_key].strip()
		new_value = new_map[old_key].strip()
		if old_value != new_value:
			fh.write(old_key + "=" + old_value+'\n')
			fh.write(old_key + "=" + new_value+'\n')
			fh.write('==============================\n')

fh.close()
