#!/usr/bin/perl

use strict;
print "usage: file1\n\n";

my $file1  = $ARGV[0];

open FILEIO1, $file1;

while(my $line = <FILEIO1>){
  chomp $line;
  print $line; 
  #`$line`;
}
