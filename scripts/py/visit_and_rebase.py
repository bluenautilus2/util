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
paths = glob.glob('*/')

dirty_branches = []
clean_branches = []
my_good_branches = []

for a in paths:
    gitPath = os.path.join(a ,".git")

    if(os.path.exists(gitPath)):
        branchlist = subprocess.check_output(["git", "-C", a, "branch"])
        splitlist = branchlist.split()
        current_branch = find_current_branch(splitlist)
        if(current_branch=="master" or current_branch=="main"):
            my_good_branches.append(a)
        branchlist = subprocess.check_output(["git", "-C", a, "diff"])
        if branchlist != "":
            print("--------------------------------Dirty: " + a) 
            dirty_branches.append(a)
        else:
            print("Clean: " + a)
            clean_branches.append(a)
        subprocess.check_output(["git", "-C", a, "fetch"])

print("\n---------Uncommitted Work------------\n")
for d in dirty_branches:
    print("This repo has uncommitted work: " + d + "\n")

print("\n---------Rebase Report------------\n")
print("Rebased: ")
for c in clean_branches:
    print(" " + c + ", ")
    report = subprocess.call(["git", "-C", c, "rebase"])
print("\n")


