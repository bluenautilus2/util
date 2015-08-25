#!/usr/bin/perl

use strict;

print "args: SHA1 ID\n example:  scrub 3492A3F5\n\n";
print "executing..\n";

my $sha1 = $ARGV[0];

my $cmd = 'git show --pretty="format:" --name-only '.$sha1;
print "Running: ".$cmd."\n";

my @lines = `$cmd`;
my $exp = "\\.js\\Z";

my $regtab = "\t";
my $regtrail = "\s+\$";

foreach my $line(@lines){
  if($line =~ m/($exp)/){
       if(!($line =~ m/target/)){
          open(FILE,"<".$line) or print "Could not open: ".$line;
          my $fileline;
          my $count = 1;
          chomp $line;
          foreach $fileline (<FILE>){

              if($fileline =~ m/\t/){
                  print $line.": Tab found on line ".$count."\n";
              }


              if($fileline =~ m/[ ]+$/){
                  print $line.": Whitespace found on line ".$count."\n";
              }

              $count++;

          }


       }
   }
}

print "\n//////////////////End of execution\n\n";

