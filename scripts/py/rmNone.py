#!/usr/bin/env python

import os
import glob
import time
import subprocess

#main program
images = {}

raw_output = subprocess.check_output(["docker", "images"])
lines = raw_output.split('\n')
lines.strip()
for line in lines:

    columns = line.split()
    #print columns[2]
    image_id = columns[2]
    #tag = columns[1]
    #images[image_id] = tag

for image in images:
    print image + " : " + images[image]


#
#paths = glob.glob('*/')
#output_dir = os.path.join(os.path.realpath('../../temp'), str(int(time.time())))
#os.mkdir(output_dir)
#newfile = os.path.join(output_dir, "report")
#fh = open(newfile, 'w')
#
#dirty_branches = []
#clean_branches = []
#my_good_branches = []
#
#for a in paths:
#    gitPath = os.path.join(a ,".git")
#
#    if(os.path.exists(gitPath)):
#        branchlist = subprocess.check_output(["git", "-C", a, "branch"])
#        splitlist = branchlist.split()
#        current_branch = find_current_branch(splitlist)
#        if(current_branch=="master"):
#            my_good_branches.append(a)
#        branchlist = subprocess.check_output(["git", "-C", a, "diff"])
#        if branchlist != "":
#            print "--------------Dirty: " + a
#            dirty_branches.append(a)
#        else:
#            print "Clean: " + a
#            clean_branches.append(a)
#        subprocess.check_output(["git", "-C", a, "fetch"])
#
#fh.write("\n---------Uncommitted Work------------\n")
#for d in dirty_branches:
#    fh.write("This repo has uncommitted work: " + d + "\n")
#
#fh.write("\n---------Rebase Report------------\n")
#for c in clean_branches:
#    fh.write("Attempting rebase for " + c + "\n")
#    report = subprocess.check_output(["git", "-C", c, "rebase"])
#    fh.write(report)
#
#fh.write("\n---------Build Report------------\n")
#for g in my_good_branches:
#    if g in clean_branches:
#        target_folder = os.path.join(g, "pom.xml")
#        if (os.path.exists(target_folder)):
#            fh.write("Should probably build: " + g + "\n")
#        else:
#            fh.write("Not built! ------" + g + " has a weird pom.xml")
