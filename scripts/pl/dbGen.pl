#!/usr/bin/perl

use strict;
use DateTime;

my $dt = DateTime->now();

my $day_of_week = $dt->day_of_week;
my $days_to_add = 0;

if($day_of_week <= 4){
   $days_to_add = (4 - $day_of_week) + 7;
}
if($day_of_week > 4){
   $days_to_add = (7 - $day_of_week) + 11;
}

my $new_day_of_year = $dt->day_of_year() + $days_to_add;
$new_day_of_year = $new_day_of_year%366;

my $nd = DateTime->from_day_of_year(year => $dt->year,day_of_year=> $new_day_of_year);

my $newyear = $nd->year;
my $newday = $nd->day;
my $newmonth = $nd->month;

if($newmonth < 10){
 $newmonth = "0".$newmonth;
}
if($newday < 10){
  $newday = "0".$newday;
}
my $dateString = $newyear."-".$newmonth."-".$newday;
my $epoch = `date +%s`;
chomp $epoch;
$dateString = $dateString."_".$epoch;
print "Generating.... $dateString \n\n";
print "Cassandra? Hit Y, or just enter to continue as Sql-->";
my $answer = <>;
chomp $answer;
print "answer was: ".$answer."\n";
my $cass = 0;

if($answer eq 'y' | $answer eq 'Y'){
  $cass = 1;
}

my $filename = $dateString.'.sql';
if($cass){
  $filename = $dateString.'.cql';
}

open(my $fh, '>', $filename) or die "Could not open file '$filename' $!";
print $fh "-- $filename\n";
print $fh "--\n";
print $fh "-- PA-123456 Jira Title Here\n";
print $fh "--\n";
print $fh "-- Brief Description of what this script does\n";
print $fh "--\n";
if(!$cass){
  print $fh "-- TYPE: DDL/DML\n";
  print $fh "--\n";
  print $fh "-- TARGET: POD_MAIN/COMMON/POD_LOGGING \n"; 
  print $fh "--\n";
  print $fh "-- EXECUTION_PLAN: PRE-DEPLOYMENT/POST-DEPLOYMENT\n";
}
print $fh "--\n";
print $fh "-- AUTHOR: First Last (youremail\@infor.com) \n";
print $fh "--\n";
print $fh "\n";
if($cass){
  print $fh "use pa;"
}
print $fh "\n";
if(!$cass){
  print $fh "EXEC addDBUpdate N'$dateString\'\n";
}else{
  print $fh "INSERT INTO cql_script_executions (year, tag, last_date_applied) VALUES ($newyear, '$dateString', DATEOF(NOW()));";
}
my $rollback = $dateString.'_rollback.sql';
if($cass){
   $rollback = $dateString.'_rollback.cql';
}
close $fh;

my $rollback = $dateString.'_rollback.sql';
if($cass){
  $rollback = $dateString.'_rollback.cql';
}

open(my $rh, '>', $rollback) or die "Could not open file '$rollback' $!";
print $rh "--\n";
print $rh "-- Rollback for Script $filename\n";
print $rh "--\n";
print $rh "-- AUTHOR: First Last (youremail\@infor.com) \n";
print $rh "--\n";
print $rh "\n";
if($cass){
  print $rh "use pa;";
}
print $rh "\n";
if(!$cass){
  print $rh "EXEC addDBUpdate N'$dateString"."_rollback\'\n";
}else{
  print $rh "INSERT INTO cql_script_executions (year, tag, last_date_applied) VALUES ($newyear, '$dateString"."_rollback', DATEOF(NOW()));";
}
close $rh;

print "$filename and $rollback generated in the current folder.\n\n";
