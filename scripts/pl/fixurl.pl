#!/usr/bin/perl

use strict;


my $input = $ARGV[0];

$input =~ s/&amp;/&/g;
$input =~ s/http/https/g;
$input =~ s/8080/8443/g;
print "\n\n\n";
print $input;
print "\n\n\n";
