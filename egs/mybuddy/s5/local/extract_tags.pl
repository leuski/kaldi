#! /usr/bin/perl -w

@tokens = ();

my %map = ( 
"(())" => "", # 3405
"(*)" => "", # 1
"(8)" => "", # 1
"(80)" => "<NOISE>", # 1
"(SOUND)" => "<NOISE>", # 1
"(THROUGH THAT BACK)" => "<SPOKEN_NOISE>", # 1
"+88+" => "<NOISE>", # 1
"+AA+" => "AH", # 19
"+AAA+" => "AH", # 1
"+AH HA+" => "AH", # 2
"+AH UM+" => "AH", # 1
"+AH UMM+" => "AH", # 12
"+AH+" => "AH", # 226
"+AHH+" => "AH", # 1
"+AHHH+" => "AH", # 1
"+AHM+" => "AH", # 1
"+AM+" => "AH", # 40
"+ARGH+" => "AH", # 2
"+ARRR+" => "AH", # 1
"+ATTRACTING+" => "<SPOKEN_NOISE>", # 1
"+BEWEWE+" => "<SPOKEN_NOISE>", # 2
"+BLAH+" => "<SPOKEN_NOISE>", # 35
"+BLUEEE+" => "<SPOKEN_NOISE>", # 1
"+BOOM+" => "<SPOKEN_NOISE>", # 1
"+BREATH+" => "<NOISE>", # 1
"+CH+" => "<SPOKEN_NOISE>", # 1
"+CLOSE+" => "<SPOKEN_NOISE>", # 1
# "+CO2+" => "<SPOKEN_NOISE>", # 1
"+DADADA+" => "<SPOKEN_NOISE>", # 1
"+DOIE+" => "<SPOKEN_NOISE>", # 1
"+DUN DUN +" => "<SPOKEN_NOISE>", # 1
"+DUN DUN+" => "<SPOKEN_NOISE>", # 1
"+EEE+" => "<SPOKEN_NOISE>", # 1
"+EEEE+" => "<SPOKEN_NOISE>", # 1
"+EH+" => "EH", # 1
"+ER+" => "EH", # 8
"+ERRR+" => "EH", # 1
"+HA HA+" => "<LAUGHTER>", # 1
"+HA+" => "<LAUGHTER>", # 7
"+HAHA+" => "<LAUGHTER>", # 3
"+HAHAHA+" => "<LAUGHTER>", # 1
# "+HELLO+" => "<SPOKEN_NOISE>", # 1
"+HM+" => "HM", # 62
"+HMM+" => "HM", # 14
"+HOOP+" => "<SPOKEN_NOISE>", # 1
"+HUH+" => "HUH", # 2
"+HUM+" => "HUH", # 13
#"+KAPISH+" => "<SPOKEN_NOISE>", # 1
#"+LOW LOW LOW+" => "<SPOKEN_NOISE>", # 1
"+MM+" => "<SPOKEN_NOISE>", # 1
"+MMMM+" => "<SPOKEN_NOISE>", # 1
# "+MORE ENERGY+" => "<SPOKEN_NOISE>", # 1
# "+MOVE+" => "<SPOKEN_NOISE>", # 1
#"+NO+" => "<SPOKEN_NOISE>", # 1
"+OH HA+" => "<SPOKEN_NOISE>", # 1
"+OH HO+" => "<SPOKEN_NOISE>", # 1
"+OH LA LA +" => "<SPOKEN_NOISE>", # 1
"+OH OH+" => "<SPOKEN_NOISE>", # 1
"+OH+" => "OH", # 10
"+OHH+" => "OH", # 2
"+OHHH+" => "OH", # 1
"+OOO +" => "OH", # 1
"+OOOOH+" => "OH", # 1
"+OP+" => "OH", # 1
"+PHEW+" => "<SPOKEN_NOISE>", # 2
"+POP+" => "<SPOKEN_NOISE>", # 1
"+PRODUCT+" => "<SPOKEN_NOISE>", # 1
"+PRRRRRRR+" => "<SPOKEN_NOISE>", # 1
"+SHAKALAKA+" => "<SPOKEN_NOISE>", # 1
"+SHH+" => "<SPOKEN_NOISE>", # 3
"+SHHH+" => "<SPOKEN_NOISE>", # 1
"+SPACERS+" => "<SPOKEN_NOISE>", # 1
"+SSS+" => "<SPOKEN_NOISE>", # 1
"+SSSHHHH+" => "<SPOKEN_NOISE>", # 1
"+SSSS+" => "<SPOKEN_NOISE>", # 1
"+SWITCH+" => "<SPOKEN_NOISE>", # 1
"+TA DA TA+" => "<SPOKEN_NOISE>", # 1
"+TA TA TA TA+" => "<SPOKEN_NOISE>", # 1
"+TADA+" => "<SPOKEN_NOISE>", # 1
"+TH+" => "<SPOKEN_NOISE>", # 1
"+THEY ARE MAGNETIC+" => "<SPOKEN_NOISE>", # 1
"+TICK TOCK+" => "<SPOKEN_NOISE>", # 1
"+TO DO DO+" => "<SPOKEN_NOISE>", # 1
"+TRPTRP+" => "<SPOKEN_NOISE>", # 1
"+TU DO DO+" => "<SPOKEN_NOISE>", # 1
"+TUDO+" => "<SPOKEN_NOISE>", # 1
"+TUP TUP TUP TUP TUP TUP+" => "<SPOKEN_NOISE>", # 1
"+TUTUTO+" => "<SPOKEN_NOISE>", # 1
"+UH HMM+" => "UH", # 2
"+UH HO+" => "UH", # 1
"+UH UMM+" => "UH", # 1
"+UH+" => "UH", # 48
"+UHH+" => "UH", # 1
"+UHM+" => "UH", # 1
"+UHU+" => "UH", # 1
"+UM+" => "UM", # 652
"+UMM+" => "UM", # 7
"+USH+" => "<SPOKEN_NOISE>", # 1
"+UU+" => "UH", # 2
"+VERY+" => "<SPOKEN_NOISE>", # 1
"+WHOA+" => "<SPOKEN_NOISE>", # 2
"+WHOO+" => "<SPOKEN_NOISE>", # 1
"+WO+" => "<SPOKEN_NOISE>", # 1
"+WOO+" => "<SPOKEN_NOISE>", # 1
"+WOOO+" => "<SPOKEN_NOISE>", # 1
"+WOWO+" => "<SPOKEN_NOISE>", # 1
"+WUHU+" => "<SPOKEN_NOISE>", # 1
"+YAM+" => "<SPOKEN_NOISE>", # 1
"+YES+" => "<SPOKEN_NOISE>", # 1
"+YO+" => "<SPOKEN_NOISE>", # 1
"< BREATH>" => "<NOISE>", # 1
"< NO-SIGNAL>" => "", # 1
"< NO_SIGNAL>" => "", # 1
"< SIDE SPEECH>" => "<SPOKEN_NOISE>", # 2
"< SILENCE>" => "", # 4
"< SINGING>" => "<NOISE>", # 1
"< UNCLEAR VOICE>" => "<SPOKEN_NOISE>", # 1
# "<'SIDE_SPEECH>" => "<SPOKEN_NOISE>", # 1
"<*>" => "<NOISE>", # 9
"<AH UMM>" => "<SPOKEN_NOISE>", # 2
"<AH>" => "<SPOKEN_NOISE>", # 1
"<AT>" => "<SPOKEN_NOISE>", # 1
"<BACKGROUND NOISE>" => "<NOISE>", # 2
"<BREATH>" => "<NOISE>", # 8401
"<BREATHE>" => "<NOISE>", # 15
"<COUGH>" => "<NOISE>", # 82
"<DISCARD>" => "<NOISE>", # 808
"<DISTURBANCE>" => "<SPOKEN_NOISE>", # 1
"<ECHO>" => "<SPOKEN_NOISE>", # 2
"<FP>" => "", # 1493
"<FSSSSSSHHH>" => "<SPOKEN_NOISE>", # 1
"<HA>" => "<LAUGHTER>", # 10 
"<HUM>" => "HM", # 42
"<INAUDIBLE>" => "<SPOKEN_NOISE>", # 1
"<INDISCERNIBLE>" => "<SPOKEN_NOISE>", # 413
"<INDISCERNIBLEY>" => "<SPOKEN_NOISE>", # 1
"<INDISCREET>" => "<SPOKEN_NOISE>", # 1
"<LAUGH>" => "<LAUGHTER>", # 1166
"<LONG BREATH>" => "<NOISE>", # 1
# "<LOW PITCH>" => "<NOISE>", # 1
"<MUSIC>" => "<NOISE>", # 1
"<NO SIGNA >" => "", # 1
"<NO SIGNAL>" => "", # 65
"<NO VOICE>" => "", # 25
"<NO _ SIGNAL>" => "", # 1
"<NO _SIGNAL>" => "", # 1
"<NO-SIGNAL>" => "", # 1
"<NOISE>" => "<NOISE>", # 669
"<NOSIE>" => "<NOISE>", # 1
"<NO_ SIGNAL>" => "", # 50
"<NO_SIGNAL>" => "", # 1115
"<NO_SPEECH>" => "", # 1
"<NO_VOICE>" => "", # 1
"<PHRRR>" => "<NOISE>", # 1
"<SIDE SIGNAL>" => "<SPOKEN_NOISE>", # 1
"<SIDE SPEAKER>" => "<SPOKEN_NOISE>", # 9
"<SIDE SPEAKERS>" => "<SPOKEN_NOISE>", # 4
"<SIDE SPEECH>" => "<SPOKEN_NOISE>", # 66
"<SIDE _ SPEECH>" => "<SPOKEN_NOISE>", # 5
"<SIDE _SPEECH>" => "<SPOKEN_NOISE>", # 2
"<SIDE-SPEECH>" => "<SPOKEN_NOISE>", # 1
"<SIDE_ SPEECH>" => "<SPOKEN_NOISE>", # 9
"<SIDE_SPEECH>" => "<SPOKEN_NOISE>", # 514
# "<SIDE_S[EECH>" => "<SPOKEN_NOISE>", # 1
# "<SIED_SPEECH>" => "<SPOKEN_NOISE>", # 1
#"<SILENCE >" => "", # 2
"<SILENCE>" => "", # 1246
"<SINGING>" => "<NOISE>", # 4
"<SNIFF>" => "<NOISE>", # 232
"<UMM>" => "<SPOKEN_NOISE>", # 1
"<UNAUDIBLE>" => "<SPOKEN_NOISE>", # 1
"<UNCLEAR AUDIO>" => "<SPOKEN_NOISE>", # 1
"<UNCLEAR VOICE >" => "<SPOKEN_NOISE>", # 1
"<UNCLEAR VOICE>" => "<SPOKEN_NOISE>", # 5
"<WHISPER>" => "<NOISE>", # 36
"<YAWN>" => "<NOISE>", # 3
"[INDISCERNIBLE]" => "<SPOKEN_NOISE>", 
"[]" => "", 
# "/COYOTE/" => " SLASH COYOTE SLASH ", 
#"[00:00:01]" => "", 
#"+A47:A60" => "",
#"0-19-1-9-2-5-3-5-4-5-5-3" => "ZERO NINETEEN ONE NINE TWO FIVE THREE FIVE FOUR FIVE FIVE THREE",
# "1-2-3-4-5-" => "ONE TWO THREE FOUR FIVE",
"A-B-C-E-F-G" => "A B C E F G",
#"-AT'S" => "<SPOKEN_NOISE>",
#"-ERE'S" => "<SPOKEN_NOISE>",
#"-EY'RE" => "<SPOKEN_NOISE>",
#"-N'T" => "<SPOKEN_NOISE>",
#"-ON'T" => "<SPOKEN_NOISE>",
"CAN'T-IF" => "CAN'T IF",
"ARE-HAVEN'T" => "ARE HAVEN'T",
"TUCK-TUKC-TUCK" => "TUCK TUKC TUCK",
"HAS-IT'S" => "HAS IT'S",
# "-ALUNIMUM" => "ALUNIMUM",
#"+UM " => "UM ",
#"WATER>" => "WATER",
#"H20" => "H2O",
# " 1 " => " ONE ",
" 2 " => " TWO ",
#" 2: " => " TWO ",
# " 3 " => " THREE ",
# " 4 " => " FOUR ",
# " 5 " => " FIVE ",
# " 6 " => " SIX ",
# " 7 " => " SEVEN ",
# " 8 " => " EIGHT ",
# " 9 " => " NINE ",
# " 10 " => " TEN ",
# " 11 " => " ELEVEN ",
# " 12 " => " TWELVE ",
# " 13 " => " THIRTEEN ",
# " 14 " => " FOURTEEN ",
# " 15 " => " FIFTEEN ",
# " 16 " => " SIXTEEN ",
# " 17 " => " SEVENTEEN ",
# " 18 " => " EIGHTEEN ",
# " 19 " => " NINETEEN ",

# " 20 " => " TWENTY ",
# " 21 " => " TWENTY ONE ",
# " 22 " => " TWENTY TWO ",
# " 23 " => " TWENTY THREE ",
# " 24 " => " TWENTY FOUR ",
# " 25 " => " TWENTY FIVE ",
# " 26 " => " TWENTY SIX ",
# " 27 " => " TWENTY SEVEN ",
# " 28 " => " TWENTY EIGHT ",
# " 29 " => " TWENTY NINE ",

# " 30 " => " THIRTY ",
# " 31 " => " THIRTY ONE ",
# " 32 " => " THIRTY TWO ",
# " 33 " => " THIRTY THREE ",
# " 34 " => " THIRTY FOUR ",
# " 35 " => " THIRTY FIVE ",
# " 36 " => " THIRTY SIX ",
# " 37 " => " THIRTY SEVEN ",
# " 38 " => " THIRTY EIGHT ",
# " 39 " => " THIRTY NINE ",

# " 40 " => " FORTY ",
# " 41 " => " FORTY ONE ",
# " 42 " => " FORTY TWO ",
# " 43 " => " FORTY THREE ",
# " 44 " => " FORTY FOUR ",
# " 45 " => " FORTY FIVE ",
# " 46 " => " FORTY SIX ",
# " 47 " => " FORTY SEVEN ",
# " 48 " => " FORTY EIGHT ",
# " 49 " => " FORTY NINE ",

# " 50 " => " FIFTY ",
# " 51 " => " FIFTY ONE ",
# " 52 " => " FIFTY TWO ",
# " 53 " => " FIFTY THREE ",
# " 54 " => " FIFTY FOUR ",
# " 55 " => " FIFTY FIVE ",
# " 56 " => " FIFTY SIX ",
# " 57 " => " FIFTY SEVEN ",
# " 58 " => " FIFTY EIGHT ",
# " 59 " => " FIFTY NINE ",

# " 60 " => " SIXTY ",
# " 61 " => " SIXTY ONE ",
# " 62 " => " SIXTY TWO ",
# " 63 " => " SIXTY THREE ",
# " 64 " => " SIXTY FOUR ",
# " 65 " => " SIXTY FIVE ",
# " 66 " => " SIXTY SIX ",
# " 67 " => " SIXTY SEVEN ",
# " 68 " => " SIXTY EIGHT ",
# " 69 " => " SIXTY NINE ",

# " 70 " => " SEVENTY ",
# " 71 " => " SEVENTY ONE ",
# " 72 " => " SEVENTY TWO ",
# " 73 " => " SEVENTY THREE ",
# " 74 " => " SEVENTY FOUR ",
# " 75 " => " SEVENTY FIVE ",
# " 76 " => " SEVENTY SIX ",
# " 77 " => " SEVENTY SEVEN ",
# " 78 " => " SEVENTY EIGHT ",
# " 79 " => " SEVENTY NINE ",

#" 80 " => " EIGHTY ",
#" 81 " => " EIGHTY ONE ",
#" 82 " => " EIGHTY TWO ",
#" 83 " => " EIGHTY THREE ",
#" 84 " => " EIGHTY FOUR ",
#" 85 " => " EIGHTY FIVE ",
#" 86 " => " EIGHTY SIX ",
#" 87 " => " EIGHTY SEVEN ",
#" 88 " => " EIGHTY EIGHT ",
#" 89 " => " EIGHTY NINE ",

#" 90 " => " NINETY ",
#" 100 " => " ONE HUNDRED ",
#" 200 " => " TWO HUNDRED ",

#" 300 " => " THREE HUNDRED ",
#" 300MG " => " THREE HUNDRED MG ",
# correcting typo
#" 384 " => " THREE TO FOUR ",
#" 5000 " => " FIVE THOUSAND ",

#" 12345 " => " ONE TWO THREE FOUR FIVE ",
#"IT FLIPPED AROUND 10- THEREFORE ENERGY IS FLOWING TOWARDS POSITIVE SIGN AND COMING OUT THROUGH OTHER END" => "IT FLIPPED AROUND TEN THEREFORE ENERGY IS FLOWING TOWARDS POSITIVE SIGN AND COMING OUT THROUGH OTHER END",
#"SUGAR IS THE 100 GRAMS THE CITRIC" => "SUGAR IS THE HUNDRED GRAMS THE CITRIC",
#"THE 150 MILLIMETERS AND THE OTHER ONE IS 100" => "THAT ONE FIFTY MILLIMETERS AND THE OTHER ONE IS HUNDRED",
#"THEN ONE BRICK IN ONE 20 BRICK IN AND IT HIGH" => "THEN ONE BRICK IN ONE TWENTY BRICK IN AND IT WASN'T",
#"LEVEL 220 BRICKS IN AND" => "LEVEL TWO TWENTY BRICKS IN AND",
#"ONE HAS 10 GRAMS OF SOLUTION AND THE OTHER HAS 1220 GRAMS OF SOLUTION" => "ONE HAS TEN GRAMS OF SOLUTION AND THE OTHER HAS TWELVE TWENTY GRAMS OF SOLUTION",
#"C33" => "C THREE THREE",
#"YEAH <SILENCE > LIKE 502 HE’S SAID KEEPING LOOK FOR IT <SILENCE> +HA+" => "YEAH NO IT'S FIFTY POINT TWO HE'S SAID TO KEEP LOOKING FOR IT",
# "(\s|^)10(\s|$)" => "$1TEN$2",

);

# https://www.perlmonks.org/?node_id=1179840

my ($regex) = map { qr/$_/ } 
    join '|', map {quotemeta}
    sort { length $b <=> length $a
           or $a cmp $b }
    keys %map;

while (<>) {
  if (!($_ =~ /^([^\s]+)\s+(.*)/)) {
    print "WARNING: cannot parse line $_";
    exit -1;
  }
  $filename = $1;
  $text = $2;
  $original_text = $2;
    
  # cleanup
  $text =~ s/’/'/g;
  $text =~ s/[[:^ascii:]]/ /g;
  $text =~ s/\s\s+/ /g;
  $text = " " . $text . " ";
#  $text =~ s/(^|\s)HAS10GMS(\s|$)/$1HAS 10 GRAMS$2/g;
#  $text =~ s/(\d)G(\s|$)/$1 GRAMS$2/g;
#  $text =~ s/(\d)GRAMS(\s|$)/$1 GRAMS$2/g;
#  $text =~ s/(\d)GMS(\s|$)/$1 GRAMS$2/g;
#  $text =~ s/(\d)ML(\s|$)/$1 MILLILITERS$2/g;
#  $text =~ s/(\d)MILLILITERS(\s|$)/$1 MILLILITERS$2/g;
  # there is a typo in the transcript
#  $text =~ s/(\d)MM(\s|$)/$1 MILLILITERS$2/g;

  # temporary 
  $text =~ s/(^|\s)2D(\s|$)/${1}TWO D$2/g;
  $text =~ s/(^|\s)1D(\s|$)/${1}ONE D$2/g;
  $text =~ s/(^|\s)CO2(\s|$)/$1C O TWO$2/g;
  $text =~ s/(^|\s)H2O(\s|$)/$1H TWO O$2/g;
#  $text =~ s/(^|\s)H20(\s|$)/$1H TWO O$2/g;
  $text =~ s/(^|\s)O2(\s|$)/$1O TWO$2/g;

  # these words seemed to highlight an unusual or incorrect pronunciation
  $text =~ s/\*([\w']*?)\*/$1/g;
  
  # fix the known tags (see the table at the start)
  $text =~ s/($regex)/$map{$1}/g;
  $text =~ s/($regex)/$map{$1}/g;

  # cleanup
  $text =~ s/\?/ /g;
  $text =~ s/;/ /g;
  $text =~ s/\./ /g;
  $text =~ s/:/ /g;

  # fix a few examples that we did not catch
#   $text =~ s/<SIDE_SPEECH/<SPOKEN_NOISE>/g;
#   $text =~ s/<NO_SIGNAL//g;
  
  # temporary 
  $text =~ s/<NOISE>//g;
  $text =~ s/<SPOKEN_NOISE>//g;
  $text =~ s/<LAUGHTER>//g;
  $text =~ s/ 'EM/ THEM/g;
  $text =~ s/ 'CAUSE/ BECAUSE/g;
  
  # unfinished words, false starts. Make them regular and to the dictionary
  $text =~ s/(\w+)-(\s+|$)/$1$2/g;

  $text =~ s/\s+$//g;
  $text =~ s/^\s+//g;

  while ($text =~ m/\(?\([\w\s]*\)\)?/sig) {
    push(@tokens, $&);
  }
  while ($text =~ m/\+.*?\+/sig) {
    push(@tokens, $&);
  }
  while ($text =~ m/\*.*?\*/sig) {
    push(@tokens, $&);
  }
  while ($text =~ m/<.*?>/sig) {
    push(@tokens, $&);
  }
  while ($text =~ m/\[.*?\]/sig) {
    push(@tokens, $&);
  }
#   while ($text =~ m/[[:punct:]]\w+[[:punct:]]/sig) {
  while ($text =~ m/\d+/sig) {
    push(@tokens, $&);
    print $&, "\n", $filename, "\n", $original_text, "\n", $text, "\n";
  }
}

my %counts;
$counts{$_}++ for @tokens;

my @sorted_keys = sort keys(%counts);

foreach my $key ( @sorted_keys ) {
  printf "\"%s\" => \"<SPOKEN_NOISE>\", # %d\n", $key, $counts{$key};
}
