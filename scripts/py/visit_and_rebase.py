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

def print_both(string, fh):
    fh.write(string)
    print(string)
 
#main program
paths = glob.glob('*/')
output_dir = os.path.join(os.path.realpath('../../temp'), str(int(time.time())))
os.mkdir(output_dir)
newfile = os.path.join(output_dir, "report")
fh = open(newfile, 'w')

dirty_branches = []
clean_branches = []
my_good_branches = []

for a in paths:
    gitPath = os.path.join(a ,".git")

    if(os.path.exists(gitPath)):
        branchlist = subprocess.check_output(["git", "-C", a, "branch"])
        splitlist = branchlist.split()
        current_branch = find_current_branch(splitlist)
        if(current_branch=="master"):
            my_good_branches.append(a)
        branchlist = subprocess.check_output(["git", "-C", a, "diff"])
        if branchlist != "":
            print "--------------------------------Dirty: " + a 
            dirty_branches.append(a)
        else:
            print "Clean: " + a
            clean_branches.append(a)
        subprocess.check_output(["git", "-C", a, "fetch"])

print_both("\n---------Uncommitted Work------------\n",fh)
for d in dirty_branches:
    print_both("This repo has uncommitted work: " + d + "\n",fh)

print_both("\n---------Rebase Report------------\n",fh)
print_both("Rebased: ",fh)
for c in clean_branches:
    print_both(" " + c + ", ", fh)
    report = subprocess.call(["git", "-C", c, "rebase"])
print_both("\n",fh)
subprocess.check_output(["cat", newfile])

