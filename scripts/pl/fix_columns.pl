#!/usr/bin/perl

use strict;

my $file  = $ARGV[0];
open FILEIO, $file;
print 'File is: '.$file." \n\n";

#fixes private variable names and removes the _ from them.

while(my $line = <FILEIO>){
  chomp $line;
  if($line =~ m/private /){

    my $str = $line;
   
    my @data = split(/\s+/, $str);
    my $varname = @data[3];
    $varname =~ s/\s+//;
    my @vararray = split(/_/,$varname);
    my $answer;
    my $firstflag = 1;
    foreach(@vararray){
       if(!$firstflag){
         my @temp = split(//,$_);
         my $firstletter = shift(@temp);
         my $rest;
         foreach(@temp){
              $rest = $rest.$_;
         }
         
         $firstletter = uc($firstletter);
         $answer = $answer.$firstletter.$rest;
       }else{
         $firstflag=0;
         $answer = $_;
       }
    } 
    print @data[0]." ".@data[1]." ".@data[2]." ".$answer." ".@data[4]." ".@data[5];     
print "\n";

  }else{
    print $line."\n";
  } 
}

close FILEIO;

