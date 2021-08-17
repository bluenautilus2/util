#!/usr/bin/perl

use strict;

print "args: 1) regex inside file \n";
print "args example: search byteInputStream \n"; 

my $fileregex = $ARGV[0];

print "\n";

$fileregex =~ s/\./\\./g;

print "File regex: ".$fileregex."\n";

if(!$fileregex){
   exit 1;
}

print "executing..\n";


my $findcmd = 'find . -iname "*.java" -type f -print';
print "Running: ".$findcmd."\n";

my @lines = `$findcmd`;

foreach my $line(@lines){
    if(!($line =~ m/target/)){ 
        my $cmd = "grep -sc ".$fileregex." ".$line;   
        my $flag = `$cmd`;
        if($flag > 0){
           chomp $line;
           print $line." ".$flag;
        }
    } 
}

print "\n//////////////////End of execution\n\n"; 
 
