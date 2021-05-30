#! /usr/bin/perl

$, = "\n";

print sort map {
  if (!($_ =~ /^([^\s]+)\s+(.*)/)) {
    print "WARNING: cannot parse line $_";
    exit -1;
  }
  $flac_path = $1;  
#  $text = $2;
  
  if (!($flac_path =~ /^(.*?)\/([^\/]+)\.flac/)) {
    print "WARNING: No flac file name in path $_";
    exit -1;
  }

  $flac_dir = $1;
  $file_name = $2;
  $speaker = substr($file_name, 0, 11);

  $file_name . " /usr/local/bin/sox " . $flac_dir . "/" . $file_name . ".flac -t wav -r 16000 -c 1 - |"
} <>;

print "\n";