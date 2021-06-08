#! /usr/bin/perl -w

while (<>) {
  if (!($_ =~ /^([^\s]+)\s+(.*)/)) {
    print "WARNING: cannot parse line $_";
    exit -1;
  }
  $filename = $1;
  $text = $2;

  # no-break space
  $text =~ s/\xc2\xa0/ /g;
  $text =~ s/…/ /g;
  $text =~ s/’/'/g;
  $text =~ s/‘/'/g;
  $text =~ s/–/-/g;
  
  $text =~ s/\?/ /g;
  $text =~ s/;/ /g;
  $text =~ s/\./ /g;
  $text =~ s/:/ /g;


#  print $filename . " " . $text, "\n";

  if ($text =~ m/[[:^ascii:]]/g) {
    $c = sprintf '%04x', ord $&;
    print "|", $c, "|", $text, "\n";
  }

}