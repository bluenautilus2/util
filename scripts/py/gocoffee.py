#!/usr/bin/env python

import sys
import re
import os.path
import time

count = 210;
while (count > 0):
	print str(count)+" seconds until coffee"
	time.sleep(30);
	count-=30
print "-----coffee time!"
