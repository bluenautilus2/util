#!/usr/bin/perl

use strict;

my $file  = $ARGV[0];
open FILEIO, $file;
print 'File is: '.$file." \n\n";

#takes a java entity and generates the middle of the hash method.

while(my $line = <FILEIO>){
  chomp $line;
  if($line =~ m/private /){

    my $str = $line;
   
    my @data = split(/\s+/, $str);
    my $varname = @data[3];
    $varname =~ s/\s+//;
   #	result = 31 * result + (legalAgreementId != null ? legalAgreementId.hashCode() : 0); 
    print "result = 31 * result + (".$varname." != null ? ".$varname.".hashCode() : 0);\n";
  } 
}

close FILEIO;

