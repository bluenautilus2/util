#!/usr/bin/perl

use strict;

print "usage: read_lines.pl <filename_with_strings> <file_to_remove_from>\n";
my $filestrings = $ARGV[0];
my $filedelete = $ARGV[1];

print "\n";


print "File with strings: ".$filestrings."\n";
print "File to remove from: ".$filedelete."\n";

print "executing..\n";

my @keylist;

open KEYS, $filestrings;

while(<KEYS>){
  chomp;  
  push @keylist,$_;
  print $_;
}

print "------End of file-------\n";
print scalar @keylist;
print " Keys found\n\n";

close KEYS;

open DELETEFILE,$filedelete;
my $newfile = $filedelete."_updated";

open NEWFILE,">>".$newfile;

while(<DELETEFILE>){
    my $keepit = '1'; 
    chomp;
     
    foreach my $key (@keylist){
       #print "checking line ".$_." for ".$key."\n";
       if(index($_,$key) != -1){
           $keepit = '0';
       }       
    }
    #print "\nkeepit is: ".$keepit; 
    if($keepit){ 
        print "\nKeeping: ".$_;
        printf NEWFILE;
    }else{
        printf "\nSKIPPING: ".$_; 
    }
}

close DELETEFILE;
close NEWFILE;

print "\n//////////////////End of execution\n\n"; 
 
