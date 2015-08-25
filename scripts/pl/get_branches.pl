#!/usr/bin/perl

use strict;

print "usage: <input_file>\n";
my $inputfile = $ARGV[0];
my $outputfile = "report.txt";
my $tempfile = "temp.txt";
print "\n";


print "Input file: ".$inputfile."\n";
print "Output file: ".$outputfile."\n";

print "executing..\n";

my @branchlist;

open BRANCHES, $inputfile;

while(<BRANCHES>){
  chomp;  
  push @branchlist,$_;
}

print scalar @branchlist;
print " Branches found\n\n";

close BRANCHES;


open OUTPUTFILE,">>".$outputfile;

foreach my $branch(@branchlist){
  my $cmd = 'git log '.$branch. ' > '.$tempfile;
  `$cmd`;
  open my $fileobj, '<',$tempfile;
  
  my $secondline = <$fileobj>;
  $secondline = <$fileobj>;
  if(index($secondline,'Merge') != -1){
    $secondline = <$fileobj>;
  }
  my $thirdline = <$fileobj>;

  my @twoline = split(/\s+/,$secondline);
  my @threeline = split(/\s+/,$thirdline);

  my $firstname = @twoline[1];
  $firstname =~ s/\s+//;
  my $lastname = @twoline[2];
  $lastname =~ s/\s+//;
  my $month = @threeline[2];
  $month =~ s/\s+//;
  my $year = @threeline[5];
  $year =~ s/\s+//; 

  print "\n **".$year.' '.$month.' '.$branch.' '.$firstname.' '.$lastname."\n"; 
  close $fileobj;  
      
}

close OUTPUTFILE;

print "\n//////////////////End of execution\n\n"; 
 
