#!/usr/bin/perl

use strict;

print "usage: output_maker.pl <filename>\n";
my $file  = $ARGV[0];

print "File: ".$file."\n";
print "executing..\n";

open FILEIO, $file;
sleep 5;
for(my $i=0; $i < 10; $i++){
  my $line = <FILEIO>;
  chomp $line;
  print "BETH";
  print $line;
  print "\n"; 
}

close FILEIO;

print "\n//////////////////End of execution\n\n"; 
 
