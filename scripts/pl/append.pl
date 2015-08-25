#!/usr/bin/perl

use strict;

print "usage: append.pl <filename>\n";
my $file  = $ARGV[0];

print "File: ".$file."\n";
print "executing..\n";
print "\n\n";
open FILEIO, $file;

while(my $line = <FILEIO>){
  chomp $line;
  my $len = length($line);
  if($len!=0){
    my $str = $line;
    $str =~ s/^\s+//;
    $str =~ s/\s+$//;
    $str =~ s/"/\\"/g;
    print "sb.append(\"".$str."\");";
    print "\n"; 
  }else{
     print "\n";
  }
}

close FILEIO;

print "\n//////////////////End of execution\n\n"; 
 
