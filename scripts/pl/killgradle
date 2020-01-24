#!/usr/bin/perl

use strict;

print "Executing.. this pid: ".$$."\n";

my $cmd1 = "ps -ef | grep gradle ";
my @procs = `$cmd1`;

my $procnum = scalar @procs;
print " Processes Found ".$procnum."\n\n";

sub isRoot{
  my $currentPid = $_[0];
  my @list = @_[1..$#_];

  #print "current: ".$currentPid."\n";
 
  if($$ == $currentPid){
    return 1;
  }
  
  my $parentPid = 0;
  foreach my $i(@list){
    #print "---".@$i[0].",".@$i[1]."---"; 
    if($currentPid==@$i[0]){
        $parentPid = @$i[1];
    }
  } 

  if($parentPid!=0){
     return isRoot($parentPid,@list);
  } else {
     return 0;
  }
}

my @pidlist;
my $count = 0;
foreach my $proc(@procs){
    #if(!($line =~ m/target/)){ 
    #print "Kill this process?-----";
    my $printy = substr($proc, 0, 256);
    print $printy."\n";    
    $count++;
    my @numbers = split(/\s+/,$proc);
    $pidlist[$count][0] = $numbers[2];
    $pidlist[$count][1] = $numbers[3]; 
}
print "\n\n";

#@pidlist = reverse @pidlist;
shift(@pidlist);

foreach my $pidArr(@pidlist){
  if(!isRoot(@$pidArr[0], @pidlist)){
    print "Killing: ".@$pidArr[0]."\n"; 
    my $cmd = "kill ".@$pidArr[0];
    `$cmd` 
  } 
}
 
