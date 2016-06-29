#!/usr/bin/env python

import os
import sys
import time

print 'Usage: ' + sys.argv[0] + '<full path to old File> <full path to new File>\n'

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


def fix_nbsp(old_string, new_string):

	if '&nbsp' in old_string:
		try:
			my_string = new_string.replace("\xc2\xa0", " ")
			return my_string
		except UnicodeDecodeError:
			print '\nUnicodeDecodeError old string: ========================='
			print old_string
			print '\nnew string ============================='
			print new_string
	return new_string
# main program

output_dir = os.path.join(os.path.realpath('.'), str(int(time.time())))
os.mkdir(output_dir)

old_map = get_keys_and_values(old_file)
new_map = get_keys_and_values(new_file)
consolidated_map = {}

for old_key in old_map:
	if old_key in new_map:
		# overwrite old stuff with new stuff
		new_value = fix_nbsp(old_map[old_key], new_map[old_key])
		consolidated_map[old_key] = new_value
	else:
		# keep old keys that weren't translated
		consolidated_map[old_key] = old_map[old_key]

for new_key in new_map:
	if new_key not in consolidated_map:
		# new stuff that wasn't there before, keep it
		consolidated_map[new_key] = new_map[new_key]

newfile = os.path.join(output_dir, 'consolidated.properties')
fh = open(newfile, 'w')
for cons_key in consolidated_map:
	fh.write(cons_key + "=" + str(consolidated_map[cons_key]) + '\n')
fh.close()
