#!/usr/bin/perl

use strict;

my $file  = $ARGV[0];
open FILEIO, $file;
print 'File is: '.$file." \n\n";

#takes a java entity and generates the middle of the copy constructor.

while(my $line = <FILEIO>){
  chomp $line;
  if($line =~ m/private /){

    my $str = $line;
   
    my @data = split(/\s+/, $str);
    my $varname = @data[3];
    $varname =~ s/\s+//;
    my $answer;
    my $firstflag = 1;

    my @temp = split(//,$varname);
    my $firstletter = shift(@temp);
    my $rest;
    foreach(@temp){
         $rest = $rest.$_;
    }
    
    $answer = uc($firstletter).$rest;
    my $time = time;
    if($line =~ m/ String/){
      print "answer.set".$answer.'("'.$answer.$time.'");'."\n";
    }
    if($line =~ m/ DateTime/){
      print "answer.set".$answer.'("new DateTime()");'."\n";
    }
    if($line =~ m/ Map<Integer,String>/){
        
       print "answer.set".$answer.'("'.$answer.$time.'");'."\n";
    }
    if($line =~ m/ Map<Integer,Integer>/){
      print "answer.set".$answer.'("'.$answer.$time.'");'."\n";
    }
    if($line =~ m/ Map<Integer,DateTime>/){
      print "answer.set".$answer.'("'.$answer.$time.'");'."\n";
    }
  } 
}

close FILEIO;

