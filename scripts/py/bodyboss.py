#!/usr/bin/env python

import sys
import re
import os.path
import time

count = 0;
while (count < 20):
        time.sleep(5)
        os.system("afplay /System/Library/Sounds/Blow.aiff")
	time.sleep(20);
        os.system("afplay /System/Library/Sounds/Submarine.aiff")
	count-=1
print "end of execution\n"
