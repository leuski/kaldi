#!/usr/bin/env bash

# collect all transcriptions into one big file

# To be run from two directories above this script.

. ./path.sh

dir=data
mkdir -p $dir

rm -f $dir/transcriptions.source.txt

for set in dev test train; do
  (cd ${mybuddy_db}/${mybuddy_collection_name} ; find data/$set -name "*.trn" -exec sh -c \
    'NAME=`basename {} .trn`; DIR=`dirname {}`; FLAC="${DIR}/${NAME}"; TEXT=`cat {} | tr "\n" " "` ; echo "${FLAC} $TEXT" ' \; ) \
   >> $dir/transcriptions.source.txt
done

sort -o $dir/transcriptions.source.txt $dir/transcriptions.source.txt

patch -o $dir/transcriptions.tmp.txt $dir/transcriptions.source.txt resources/transcriptions.patch

local/data_preparation/fix_transcriptions.pl < $dir/transcriptions.tmp.txt > $dir/transcriptions.txt 