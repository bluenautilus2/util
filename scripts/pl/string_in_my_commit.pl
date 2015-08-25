#!/usr/bin/perl
use strict;

print "args: regex inside file \n";

my $fileregex = $ARGV[0];

print "\n";

$fileregex =~ s/\./\\./g;

print "File regex: ".$fileregex."\n\n";

if(!$fileregex){
   exit 1;
}

print "executing..\n";

my $cmd = 'cd ~/repo; git show --name-status';
my @files = `$cmd`;

print (scalar @files," files found\n");

my $i = 0;
for($i=0; $i<6; $i++){
   shift @files;
}

foreach my $line(@files){
     my @temparray = split(//, $line); 
     shift @temparray;
     my $file = join('',@temparray);
     $file =~ s/^\s+//;
     $file =~ s/\s+$//;  
     my $cmd = "grep -c ".$fileregex." ".$file;   
     my $flag = `$cmd`;
     
     if($flag > 0){
        chomp $file;
        print $file." ".$flag;
     }
}

print "\n//////////////////End of execution\n\n"; 
 
