#!/usr/bin/perl
use strict;

my $script_file_name = $ARGV[0];
if(!$script_file_name){ die "Usage: $0 <script_file_name>.\n Run this in the same folder that the script is in, and pass in only the name of the script.\n"}; 
#print "\nFile: $script_file_name\n";

$script_file_name =~ s/\s+//;
my @split1 = split(/_/,$script_file_name);
my $date = @split1[0];
my @split2 = split(/\./,@split1[1]);
my $timestamp = @split2[0];
my $ext = @split2[1];

my $e = "There was a problem parsing your script Filename. Found the following: Delivery date= $date Timestamp= $timestamp Extension= $ext\n";
if(!$date || !@split1[1]){ die "$e You need to separate the delivery date and timestamp with an underscore _\n"}; 
if(!($date =~ /201\d{1}-\d{2}-\d{2}$/)){ die "$e Your delivery date string is malformed\n"};
if(!($timestamp =~ /\d{10}/)){ die "$e Timestamp must be 10 characters long. Did you use UTC Epoch?\n"};
if(!($ext = 'sql')){ die "$e Script must end in .sql\n"};
if(!(-e $script_file_name)){ die "File not found: $script_file_name. Run this script in the same folder the file is in. Pass in only the name of the script.\n"};
my $rollback_file_name = 'rollback/'.$date.'_'.$timestamp.'_rollback.'.$ext;
if(!(-e $rollback_file_name)) { die "Looking for $rollback_file_name... No rollback script found. You must write one, even if it is empty.\n"}; 

#Scan first 30 lines of script for required tags
my $typeLine;
my $targetLine;
my $planLine;

open SQL, $script_file_name;
my $count = 0;
while(<SQL>){
  chomp;  
  if(/TYPE:/){ $typeLine=$_};
  if(/TARGET:/){$targetLine=$_};
  if(/EXECUTION_PLAN:/){$planLine=$_};  
  #print $_;
  if($count>30){
    last;
  }else{
    $count++;
  }
}

close SQL;
$e = "There was a problem parsing the tags in the header of your script. ";
#---------type
if(!$typeLine){ die "$e You must include a TYPE: in the first 30 lines of the header. (Type must be either DDL or DML)\n"};
if(($typeLine !~ /DDL/)&&($typeLine !~ /DML/)){ die "$e TYPE: must be DDL or DML\n"};
if(($typeLine =~ /DDL/)&&($typeLine =~ /DML/)){ die "$e TYPE: must be DDL or DML but not both. Pick one.\n"};
#print "Found type: $typeLine\n";
#---------target
if(!$targetLine){ die "$e You must include a TARGET: in the first 30 lines of the header. (Target is one and only one of these: POD_MAIN, COMMON, POD_LOGGING)\n"};
if(($targetLine !~ /POD_MAIN/)&&($targetLine !~ /COMMON/)&&($targetLine !~ /POD_LOGGING/)){ die "$e TARGET: must be POD_MAIN, COMMON, or POD_LOGGING\n"};
my $error = "$e TARGET: must be one and only one of these: POD_MAIN, COMMON, or POD_LOGGING\n";
if(($targetLine =~ /POD_MAIN/)&&($targetLine =~ /COMMON/)){ die $e.$error};
if(($targetLine =~ /POD_MAIN/)&&($targetLine =~ /POD_LOGGING/)){ die $e.$error}; 
if(($targetLine =~ /COMMON/)&&($targetLine =~ /POD_LOGGING/)){ die $e.$error};
#print "Found target: $targetLine\n";
#---------plan
if(!$planLine){ die "$e You must include an EXECUTION_PLAN: in the first 30 lines of the header. (Plan must be either PRE-DEPLOYMENT or POST-DEPLOYMENT)\n"};
if(($planLine !~ /PRE-DEPLOYMENT/)&&($planLine !~ /POST-DEPLOYMENT/)){ die "$e EXECUTION_PLAN must be set to PRE-DEPLOYMENT or POST-DEPLOYMENT\n"};
if(($planLine =~ /PRE-DEPLOYMENT/)&&($planLine =~ /POST-DEPLOYMENT/)){ die "$e Execution plan must be PRE-DEPLOYMENT or POST-DEPLOYMENT but not both. Pick one.\n"};
#print "Found execution plan: $planLine\n";

#Scan entire script for the update call
my $update;
open SQL, $script_file_name;
my $count = 0;
while(<SQL>){
  chomp;  
  if(/addDBUpdate/){$update=$_};
}
close SQL;

if(!$update){ die "You must include a call to the addDBUpdate procedure near the end of your script\n"}
my $updateParam = "$date\_$timestamp";
if($update !~ /$updateParam/){ die "The parameter you passed to addDBUpdate doesn't match your filename. Was expecting $updateParam somewhere on that line, but found: $update\n"};

print "===========Script check complete. Script is valid!================\n";

