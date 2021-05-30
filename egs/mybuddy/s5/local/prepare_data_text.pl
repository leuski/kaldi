#! /usr/bin/perl -w

$, = "\n";

print sort map {
  if (!($_ =~ /^([^\s]+)\s+(.*)/)) {
    print "WARNING: cannot parse line $_";
    exit -1;
  }
  $flac_path = $1;  
  $text = $2;
  
  if (!($flac_path =~ /^(.*?)\/([^\/]+)\.flac/)) {
    print "WARNING: No flac file name in path $_";
    exit -1;
  }

  $file_name = $2;
  $text =~ s/[[:^ascii:]]/ /g;
  $text =~ s/\s\s+/ /g;
  $text =~ s/\s$//g;

#   if ($text =~ /\+\w+\+/) {
#     $flac_path . " " . $text; 
#   } else {
#     "";
#   }

#  $text

 $file_name . " " . $text
} <>;

print "\n";