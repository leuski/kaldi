#! /usr/bin/perl -w

while (<>) {
  if (!($_ =~ /^([^\s]+)\s+(.*)/)) {
    print "WARNING: cannot parse line $_";
    exit -1;
  }
#  $filename = $1;
  $text = $2;

  if ($text eq "") {
    next
  }

  print $text, "\n";
}