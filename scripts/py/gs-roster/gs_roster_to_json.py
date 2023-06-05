#!/usr/bin/env python3

import sys
import re
import os.path
import time


fh = open("gs-roster.csv", 'r')
lines = fh.readlines()
map_to_return = {}
print("[")
count = 550
for line in lines:
  count=count + 1
  items = line.split(",")
  print("  {")
  print("       \"givenName\": \"" + items[0] + "\",")
  print("       \"familyName\": \"" + items[1] + "\",")
  print("       \"middleName\": \"Danger\",")
  print("       \"fullName\": \"" + items[0] + " " + items[1] + "\",")
  print("       \"sourcedId\": \"" + items[2] + "\",")
  print("       \"userTrn\": \"" + "trn:user:us:tfs::"+str(count)+ "\",")
  print("       \"email\": \"" + items[3] + "\",")
  print("       \"status\": \"Active\"")
  print("  },")

print("]")

fh.close()
