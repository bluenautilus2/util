#!/usr/bin/perl
use strict;

print 'Usage: <cmd> class_name set_variable_name containing_class_name'."\n";
print 'Ex: <cmd> Meeting attendedMeetings Employee '."\n";
print 'Ex: <cmd> Position deletedPositions BusinessUnit'."\n\n\n"; 

my $upper_class = $ARGV[0]; #this is singular
my $var_name = $ARGV[1]; #this is plural
my $containing_class = $ARGV[2]; #class this is going into

if (!$upper_class || !$var_name || !$containing_class) { die};

my @temp = split(//,$upper_class);
my $firstletter = shift(@temp);
my $rest;

foreach(@temp){
     $rest = $rest.$_;
}
    
my $lower_class = lc($firstletter).$rest;

my @temp = split(//,$var_name);
my $firstletter = shift(@temp);
my $rest;

foreach(@temp){
     $rest = $rest.$_;
}
my $upper_var_name = uc($firstletter).$rest;


print ''."\n";
print 'public void set'.$upper_var_name.'('."\n";
print 'final Set<'.$upper_class.'> '.$var_name.') {'."\n";
print 'if (!this.'.$var_name.'.isEmpty()) {'."\n";
print 'for (final '.$upper_class.' c : new HashSet<>('."\n";
print 'this.'.$var_name.')) {'."\n";
print 'if (!'.$var_name.'.contains(c)) {'."\n";
print 'removeFrom'.$upper_var_name.'(c);'."\n";
print '}'."\n";
print '}'."\n";
print '}'."\n";
print 'if ('.$var_name.' != null) {'."\n";
print 'for (final '.$upper_class.' o : new HashSet<>('."\n";
print $var_name.')) {'."\n";
print 'addTo'.$upper_var_name.'(o);'."\n";
print '}'."\n";
print '} else {'."\n";
print 'this.'.$var_name.' = new HashSet<>();'."\n";
print '}'."\n";
print '}'."\n";
print ''."\n";
print ''."\n";
print 'public void removeFrom'.$upper_var_name.'('."\n";
print 'final '.$upper_class.' '.$lower_class.') {'."\n";
print 'checkNotNull('.$lower_class.', "object to remove must not be null");'."\n";
print 'if (('.$lower_class.' != null) && (this.'.$var_name.'.contains('."\n";
print $lower_class.'))) {'."\n";
print 'this.'.$var_name.'.remove('.$lower_class.');'."\n";
print $lower_class.'.set'.$containing_class.'(null);'."\n";
print '}'."\n";
print '}'."\n";
print ''."\n";
print ''."\n";
print 'public void removeFrom'.$upper_var_name.'('."\n";
print 'final Set<'.$upper_class.'> '.$var_name.') {'."\n";
print 'for (final '.$upper_class.' o : new HashSet<>('.$var_name.')) {'."\n";
print 'removeFrom'.$upper_var_name.'(o);'."\n";
print '}'."\n";
print '}'."\n";
print ''."\n";
print ''."\n";
print 'public void addTo'.$upper_var_name.'('."\n";
print 'final '.$upper_class.' '.$lower_class.') {'."\n";
print 'if ('.$lower_class.' != null) {'."\n";
print 'if (!this.'.$var_name.'.contains('.$lower_class.')) {'."\n";
print 'this.'.$var_name.'.add('.$lower_class.');'."\n";
print $lower_class.'.set'.$containing_class.'(this);'."\n";
print '}'."\n";
print '}'."\n";
print '}'."\n";
print ''."\n";
print ''."\n";
print ''."\n";
print 'public void addTo'.$upper_var_name.'('."\n";
print 'final Set<'.$upper_class.'> '.$lower_class.') {'."\n";
print 'for (final '.$upper_class.' o : new HashSet<>('.$var_name.')) {'."\n";
print 'addTo'.$upper_var_name.'(o);'."\n";
print '}'."\n";
print '}'."\n";
print ''."\n";
print 'public Set<'.$upper_class.'> get'.$upper_var_name.'() {'."\n";
print 'return Collections.unmodifiableSet(this.'.$var_name.');'."\n";
print '}'."\n";

