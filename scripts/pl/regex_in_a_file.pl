#!/usr/bin/perl

use strict;

print "args: 1) regex inside file  2)file extension\n";
print "args example: search byteInputStream java\n"; 

my $fileregex = $ARGV[0];
my $fileext = $ARGV[1];

print "\n";
print "File regex: ".$fileregex." File extension: ".$fileext."\n";

if(!$fileregex | !$fileext){
   exit 1;
}

print "executing..\n";

my $findcmd = 'find . -type f -print';
print "Running: ".$findcmd."\n";

my @lines = `$findcmd`;
my $exp = "\\.".$fileext."\\Z";
#print $exp."\n";

foreach my $line(@lines){
  if($line =~ m/($exp)/){
       if(!($line =~ m/target/)){ 
           my $cmd = "grep -c ".$fileregex." ".$line;   
           my $flag = `$cmd`;
           if($flag > 0){
              chomp $line;
              print $line." ".$flag;
           }
       } 
   }
}

print "\n//////////////////End of execution\n\n"; 
 
