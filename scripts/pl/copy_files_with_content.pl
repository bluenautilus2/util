#!/usr/bin/perl

use strict;

print "args: 1) regex inside file 2) place to copy new files to \n";
print "args example: byteInputStream newfolder\n"; 

my $fileregex = $ARGV[0];
my $new_file_location = $ARGV[1];

if(!$new_file_location){
  print "You must specify a new file location\n";
  exit 1;
}

print "\n";
print "copying files to: ".$new_file_location."\n";
my $cmd1 = "mkdir ".$new_file_location;
`$cmd1`;

$fileregex =~ s/\./\\./g;

print "File regex: ".$fileregex."\n";

if(!$fileregex){
   exit 1;
}

print "executing..\n";


my $findcmd = 'find . -type f -print';
print "Running: ".$findcmd."\n";

my @lines = `$findcmd`;

#line is the name of a file
foreach my $line(@lines){
    if(!($line =~ m/target/)){ 
        my $cmd = "grep -sc ".$fileregex." ".$line;   
        my $flag = `$cmd`;
        if($flag > 0){
          chomp $line;
          my $copy_cmd = "cp ".$line." ".$new_file_location."/";
          `$copy_cmd`;   
        }
    } 
}

print "\n//////////////////End of execution\n\n"; 
 
