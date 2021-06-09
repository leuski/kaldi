#! /usr/bin/perl

$data_root_dir = $ARGV[0];
$target_dir = $ARGV[1];
$audio_list_file_name = $ARGV[2];
$master_transcript_file = $ARGV[3];

open(AUDIO_FILES, '<', $target_dir . "/" . $audio_list_file_name) or die $!;
open(TRANSCRIPTS, '<', $master_transcript_file) or die $!;

my %transcripts = map { 
  if (!($_ =~ /^([^\s]+)\s+(.*)/)) {
    print "WARNING: cannot parse line $_";
    exit -1;
  }
  $filename = $1;
  $text = $2;
  $filename => $text 
} <TRANSCRIPTS>;

close(TRANSCRIPTS);

open(TEXT, '>', $target_dir . "/text") or die $!;
open(WAV_SCP, '>', $target_dir . "/wav.scp") or die $!;
open(UTT2SPK, '>', $target_dir . "/utt2spk") or die $!;

while (<AUDIO_FILES>) {
  chomp;
  $flac_path = $_;

  # audio file path is a .flac file relative path to the data root
  if (!($flac_path =~ /^(.*?)\/([^\/]+)\.flac/)) {
    print "WARNING: No flac file name in path $_", "\n";
    exit -1;
  }

  $flac_dir = $1;
  $file_name = $2;
  
  # transcripts are indexed using file relative path without extension
  $transcript_key = $flac_dir . "/" . $file_name;

  if (!exists $transcripts{$transcript_key}) {
    next;
  }
  
  $text = $transcripts{$transcript_key};
  
  if ($text eq "") {
    next;
  }
  
  $speaker = substr($file_name, 0, 11);

  print TEXT    $file_name . " " . $text, "\n";
  print WAV_SCP $file_name . " /usr/local/bin/flac -d " .  $data_root_dir . "/" . $flac_path . " -c |", "\n";
  print UTT2SPK $file_name . " " . $speaker, "\n";
}

close(UTT2SPK);
close(WAV_SCP);
close(TEXT);
close(AUDIO_FILES);
