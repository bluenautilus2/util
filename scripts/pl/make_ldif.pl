#!/usr/bin/perl

use strict;

my $file  = $ARGV[0];
my $arg2 = $ARGV[1];
open FILEIO, $file;

# set up the topmost elements
if(!($arg2 eq "delete")){
 
  print "dn: dc=peopleanswers,dc=com\n";
  print "objectClass: dcObject\n";
  print "objectClass: organization\n";
  print "o: Infor PeopleAnswers\n";
  print "dc: peopleanswers\n";
  print "\n";
  print "dn: ou=people,dc=peopleanswers,dc=com\n";
  print "objectClass: top\n";
  print "objectClass: OrganizationalUnit\n";
  print "ou: people\n";
  print "\n";
  print "dn: ou=groups,dc=peopleanswers,dc=com\n";
  print "objectclass:organizationalunit\n";
  print "ou: groups\n";
  print "description: generic groups branch\n";
  print "\n";


} 
#create the users
while(my $line = <FILEIO>){
  chomp $line;
  my $len = length($line);
  if($len!=0){
    my $str = $line;
   
    my @data = split(/\s+/, $str);
    my $first = @data[0];
    $first =~ s/\s+//;
    my $last = @data[1];
    $last =~ s/\s+//;
    my $email = @data[2];
    $email =~ s/\s+//;
    my @firstarray = split(//,$first);
    my $firstchar = shift @firstarray;
    my $login = $firstchar.$last; 
    $login = lc $login;

    if(($arg2 eq "delete")){

      print "cn=$first $last,ou=people,dc=peopleanswers,dc=com\n";

    }else{

      print "dn: cn=$first $last,ou=people,dc=peopleanswers,dc=com\n";
      print "objectclass: inetOrgPerson\n";
      print "cn: $first $last\n";
      print "sn: $last\n";
      print "uid: $login\n";
      print "userpassword: gab4ever\n";
      print "mail: $email\n";
      print "ou: Product Development\n"; 
      print "\n"; 
    }
  }
  
}

close FILEIO;

if(!($arg2 eq "delete")){
  #create the common group
  print "dn: cn=developers,ou=groups,dc=peopleanswers,dc=com\n";
  print "objectclass: groupofnames\n";
  print "cn: developers\n";
  print "description: regular gerrit access\n"; 
}

open FILEIO, $file;
#create the users in that group
while(my $line = <FILEIO>){
  chomp $line;
  my $len = length($line);
  if($len!=0){
    my $str = $line;
   
    my @data = split(/\s+/, $str);
    my $first = @data[0];
    $first =~ s/\s+//;
    my $last = @data[1];
    $last =~ s/\s+//;

    if(!($arg2 eq "delete")){
      print "member: cn=$first $last,ou=people,dc=peopleanswers,dc=com\n";
    }
  }
}
print "\n";  

#  print "dn: cn=leads,ou=groups,dc=peopleanswers,dc=com\n";
#  print "objectclass: groupofnames\n";
#  print "cn: leads\n";
#  print "description: members with special access\n"; 

if(($arg2 eq "delete")){
  print "cn=developers,ou=groups,dc=peopleanswers,dc=com\n";
  print "ou=groups,dc=peopleanswers,dc=com\n";
  print "ou=people,dc=peopleanswers,dc=com\n";
  print "dc=peopleanswers,dc=com\n";
  print "\n";
}

close FILEIO;

 
