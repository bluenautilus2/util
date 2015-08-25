#!/usr/bin/perl

use strict;
print "usage: file1 file2.   outputs diff.txt\n\n";

my $file1  = $ARGV[0];
my $file2 = $ARGV[1];
my $fileu1;
my $fileu2;
my $files;

open FILEIO1, $file1;
open FILEIO2, $file2;
open $fileu1, '>','venn_1_uniq.txt';
open $fileu2,'>','venn_2_uniq.txt';
open $files,'>','venn_same.txt'; 

my @data1; 
while(my $line = <FILEIO1>){
  chomp $line;
  chomp $line;
  push @data1,$line;  
}
print "first file had ".(scalar @data1)." lines\n"; 

my @data2; 
while(my $line = <FILEIO2>){
  chomp $line;
  chomp $line;
  push @data2,$line;  
}
print "second file had ".(scalar @data2)." lines\n"; 
my $x1;
my $x2;

foreach $x1 (@data1){
    my $found = 0;    
    foreach $x2 (@data2){
    
       if($x1 eq $x2){
          print $files $x1;
          print $files "\n";
          $found=1;
       }
    }
    if(!$found){
       print $fileu1 $x1; 
       print $fileu1 "\n";
    } 
}

foreach $x2 (@data2){
   my $found = 0;
   foreach $x1 (@data1){
      
      if($x2 eq $x1){
         $found = 1;
      } 
   }
   if(!$found){
      print $fileu2 $x2; 
      print $fileu2 "\n";
   }
}

close FILEIO1;
close FILEIO2;
close $fileu1;
close $fileu2;
close $files;


