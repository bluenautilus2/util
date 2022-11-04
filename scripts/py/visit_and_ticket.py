#!/usr/bin/env python

import os
import glob
import time
import subprocess


def find_current_branch(array_branches):
    counter = 0
    for branch in array_branches:
        if branch == "*":
            return array_branches[counter + 1]
        counter += 1

#main program
paths = glob.glob('*/*')

dirty_branches = []
clean_branches = []
my_good_branches = []

for a in paths:
    gitPath = os.path.join(a ,".git")

    if(os.path.exists(gitPath)):
        branchlist = subprocess.check_output(["git", "-C", a, "branch"])
        splitlist = branchlist.split()
        current_branch = find_current_branch(splitlist)
        subprocess.call(["git", "-C", a, "push", "--set-upstream","origin","ESPLAT-10090-log4j-17-1"])
        #subprocess.check_output(["git", "-C", a, "checkout", "-b", "ESPLAT-10090-log4j-17-1"])

print("\n---------Rebase Report------------\n")
print("Rebased: ")
for c in clean_branches:
    print(" " + c + ", ")
    report = subprocess.call(["git", "-C", c, "rebase"])
print("\n")

