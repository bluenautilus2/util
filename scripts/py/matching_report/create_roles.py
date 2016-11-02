#!/usr/bin/env python

import os
import pprint
import time


# Time to read in spreadsheet - SREAD
# First Query: - QUERY1
# Built 2137917 BeanMatchingCandidates - BUILD
# Time to execute second query on 500 candidates - QUERY2
# Actual matching in JVM memory for batch of 500 - MATCH
# Time to save all candidate matching data for batch of 1500 - SAVE


# _collector=*prd.app.ts.*  _sourceHost=paprod*tomcat*  _SourceCategory=application.tomcat  "#@#STATS "

class Header:
	sread_time = 1
	sread_rows = 2
	query1_time = 3
	query1_text = 4
	num_found = 5
	build_time = 6
	query2_time_array = 7
	match_time_array = 8
	save_time = 9


def make_output_file():
	output_dir = os.path.join(os.path.realpath('.'), str(int(time.time())))
	os.mkdir(output_dir)
	new_file = os.path.join(output_dir, "report.txt")
	return open(new_file, 'w')


def get_session(map, session_id):
	if session_id not in map:
		new_session = {}
		map[session_id] = new_session
	return map[session_id]


def do_save(in_line, session_obj):
	temp = in_line.split()
	session_obj[Header.save_time] = temp[2]
	return session_obj


def do_match(in_line, session_obj):
	temp = in_line.split()
	if Header.match_time_array not in session_obj:
		session_obj[Header.match_time_array] = []

	time_array = session_obj[Header.match_time_array]
	time_array.append(temp[2])
	session_obj[Header.match_time_array] = time_array
	return session_obj


def do_query2(in_line, session_obj):
	temp = in_line.split()
	if Header.query2_time_array not in session_obj:
		session_obj[Header.query2_time_array] = []

	time_array = session_obj[Header.query2_time_array]
	time_array.append(temp[2])
	session_obj[Header.query2_time_array] = time_array
	return session_obj


def do_query1(in_line, session_obj):
	start_index = in_line.find('$$$')
	end_index = in_line.rfind('$$$')
	session_obj[Header.query1_text] = in_line[start_index + 3:end_index]
	no_query_string = in_line[:start_index]
	temp = no_query_string.split()
	session_obj[Header.query1_time] = temp[2]
	return session_obj


def do_build(in_line, session_obj):
	temp = in_line.split()
	session_obj[Header.num_found] = temp[3]
	session_obj[Header.build_time] = temp[2]
	return session_obj


def do_sread(in_line, session_obj):
	temp = in_line.split()
	session_obj[Header.sread_rows] = temp[3]
	session_obj[Header.sread_time] = temp[2]
	return session_obj


# main program

fh = open(os.path.join(os.path.realpath('.'), "input.txt"), 'r')
lines = fh.readlines()
my_map = {}

for line in lines:
	line.strip()
	split_up = line.split()
	session_id = split_up[0]
	session_obj = get_session(my_map, session_id)

	if line.find('SAVE') != -1:
		session_obj = do_save(line, session_obj)
	if line.find('MATCH') != -1:
		session_obj = do_match(line, session_obj)
	if line.find('QUERY2') != -1:
		session_obj = do_query2(line, session_obj)
	if line.find('SREAD') != -1:
		session_obj = do_sread(line, session_obj)
	if line.find('BUILD') != -1:
		session_obj = do_build(line, session_obj)
	if line.find('QUERY1') != -1:
		session_obj = do_query1(line, session_obj)
	my_map[session_id] = session_obj

of = make_output_file()

of.write("Session \t")
of.write("Total Run Time\t")
of.write("Spreadsheet Read Time \t")
of.write("Spreadsheet Rows\t ")
of.write("Query1 Time \t")
of.write("Query Text\t")
of.write("Candidates Found\t ")
of.write("Bean Build Time\t")
of.write("Query2 Time Average\t")
of.write("Query2 Time Total\t")
of.write("Match Time Average\t")
of.write("Match Time Total\t")
of.write("Result Save Time\t")
of.write('\n')

for key in my_map:
	session_obj = my_map[key]
	match_array = session_obj[Header.match_time_array]
	match_total = 0
	for time in match_array:
		match_total = match_total + int(time)

	avg_match = match_total / len(match_array)
	query2_array = session_obj[Header.query2_time_array]
	query2_total = 0
	for query in query2_array:
		query2_total = query2_total + int(query)
	avg_query = query2_total / len(query2_array)

        print ('bad session: '+ key)

	total_total = int(session_obj[Header.sread_time]) + int(session_obj[Header.query1_time]) + int(
		session_obj[Header.build_time]) + query2_total + match_total + int(session_obj[Header.save_time])

	of.write(key + "\t")
	of.write(str(total_total) + "\t")
	of.write(session_obj[Header.sread_time] + "\t")
	of.write(session_obj[Header.sread_rows] + "\t")
	of.write(session_obj[Header.query1_time] + "\t")
	of.write(session_obj[Header.query1_text] + "\t")
	of.write(session_obj[Header.num_found] + "\t")
	of.write(session_obj[Header.build_time] + "\t")
	of.write(str(avg_query) + "\t")
	of.write(str(query2_total) + "\t")
	of.write(str(avg_match) + "\t")
	of.write(str(match_total) + "\t")
	of.write(session_obj[Header.save_time] + "\t")
	of.write("\n")

of.close()
