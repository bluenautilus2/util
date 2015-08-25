#!/usr/bin/perl

use strict;
use DateTime;

my $dt = DateTime->now();

print 'Today is '.$dt->day_name;
print 'Today is '.$dt->day_of_week;
print "\n";

my $day_of_week = $dt->day_of_week;
my $days_to_add = 0;

if($day_of_week <= 4){
   $days_to_add = (4 - $day_of_week) + 7;
}
if($day_of_week > 4){
   $days_to_add = (7 - $day_of_week) + 12;
}

my $new_day_of_year = $dt->day_of_year() + $days_to_add;
$new_day_of_year = $new_day_of_year%366;

my $nd = DateTime->from_day_of_year(year => $dt->year,day_of_year=> $new_day_of_year);

my $newyear = $nd->year;
my $newday = $nd->day;
my $newmonth = $nd->month;

if($newday < 10){
  $newday = '0'.$newday;
}
if($newmonth < 10){
  $newmonth = '0'.$newmonth;
}

print "\n Next delivery is $newday, $newmonth, $newyear\n\n";

my $epoch = `date +%s`;
my $filename = $newyear.'-'.$newmonth.'-'.$newday.'_'.$epoch;


