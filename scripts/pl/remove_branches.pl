#!/usr/bin/perl

use strict;

print "usage: <input_file>\n";
my $inputfile = $ARGV[0];
my $outputfile = "report.txt";
my $tempfile = "temp.txt";
print "\n";


print "Input file: ".$inputfile."\n";
print "Output file: ".$outputfile."\n";

print "executing..\n";

my @branchlist;

open BRANCHES, $inputfile;

while(<BRANCHES>){
  chomp;  
  push @branchlist,$_;
}

print scalar @branchlist;
print " Branches found\n\n";

close BRANCHES;


open OUTPUTFILE,">>".$outputfile;

foreach my $branch(@branchlist){
  my $cmd = 'git branch -D -r '.$branch;
  `$cmd`;
  print $cmd."\n";
}

close OUTPUTFILE;

print "\n//////////////////End of execution\n\n"; 
 
