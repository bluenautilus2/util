#!/usr/bin/perl

use strict;

print "no args\n";

print "executing..\n";


my $lscmd = 'ls --format single-column -1';
print "Running: ".$lscmd."\n";

my $fileext = "jar";
my @lines = `$lscmd`;
my $exp = "\\.".$fileext."\\Z";
#print $exp."\n";

foreach my $line(@lines){
  if($line =~ m/($exp)/){
     chomp $line; 
     my $folder = $line."_folder";
     mkdir($folder);
     my $cmd3= "unzip ".$line." -d ".$folder;
     print("\n", $cmd3,"\n");
     `$cmd3`; 
  }
}

print "\n//////////////////End of execution\n\n"; 
 
