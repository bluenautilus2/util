#!/usr/bin/env python

import os
import time
import random
import string


def coin_toss():
	coin = random.randint(0, 1)
	if coin==1:
		return True
	else:
		return False

# main program #
NUMBER_CANDIDATES = 100

lf = open('generated_spreadsheet.tdf', 'a')
lf.write('First Name\tLast Name\tCompany_Candidate_ID\tEmail\tSSN\tBirth Year\tPhone Number\n')
first_name_len = random.randint(3, 15)
last_name_len = random.randint(5, 20)

for num in range(0, NUMBER_CANDIDATES):

	first_name = random.choice(string.ascii_uppercase)
	last_name = random.choice(string.ascii_uppercase)

	for num in range(0, first_name_len):
		char = random.choice(string.ascii_lowercase)
		first_name = first_name + char

	for num in range(0, last_name_len):
		char = random.choice(string.ascii_lowercase)
		last_name = last_name + char

	company_candidate_id = str(random.randint(10000, 100000))
	ssn = str(random.randint(100000000, 999999999))
	birth_year = str(random.randint(1900, 2001))
	phone_seed = str(random.randint(100, 999))
	phone_number = '214-' + phone_seed + '-' + birth_year
	email = first_name + '.' + last_name + phone_seed + '@blather.com'

	lf.write(first_name + '\t' + last_name + '\t' + company_candidate_id + '\t' + email)
	lf.write('\t')
	if coin_toss():
		lf.write(ssn)
	lf.write('\t')
	if coin_toss():
		lf.write(birth_year)
	lf.write('\t')
	if coin_toss():
		lf.write(phone_number)
	lf.write('\n')
	# end of candidates loop #

lf.close()


