#!/usr/bin/env python

import sys
import re
import os.path
import time

count = 75;
while (count > 0):
	print str(count)+" seconds until server"
	time.sleep(10);
	count-=10
print "-----server time!"
