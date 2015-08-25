#!/usr/bin/perl

use strict;

my $file  = $ARGV[0];
open FILEIO, $file;
print 'File is: '.$file." \n\n";

#takes a java entity and generates the middle of the copy constructor.

while(my $line = <FILEIO>){
  chomp $line;
  if($line =~ m/private Map<Integer/){

    my $str = $line;
   
    my @data = split(/\s+/, $str);
    my $varname = @data[4];
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
   # print "set".$answer."(entity.get".$answer."());\n";
   # print $varname.' = entity.'.$varname.";\n";
   # print  'allKeys.addAll(this.'.$varname.'.keySet());'."\n";
   # print 'this.'.$varname.".put(i,employer.get$answer());\n";  
   # print 'school.set'.$answer."(this.$varname.get(key));\n";  
    print 'newObj.set'.$answer."(\"$varname"."String\"+i);\n";  
  #  if(!($line =~ m/ Map</)){
  #     print('bob.set'.$answer.'("'.$varname.'String");'."\n");
  #  }

  } 
}

close FILEIO;

