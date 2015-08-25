#!/usr/bin/perl

use strict;

print "args: 1) regex inside file  2)file extension\n";
print "args example: search byteInputStream java\n"; 

my $fileregex = $ARGV[0];

print "\n";

$fileregex =~ s/\./\\./g;

print "String: ".$fileregex."\n";

if(!$fileregex){
   exit 1;
}

print "executing..\n";

my $findcmd = 'find . -type f -print';
print "Running: ".$findcmd."\n";

my @lines = `$findcmd`;
my $exp = $fileregex;
#print $exp."\n";

foreach my $line(@lines){
  if($line =~ m/($exp)/){
       if((!($line =~ m/target/))&& 
          (!($line =~ m/WebRoot/))&&
          (!($line =~ m/out\/test/))){
              chomp $line;
              print $line."\n";
       } 
   }
}

print "\n//////////////////End of execution\n\n"; 
 
