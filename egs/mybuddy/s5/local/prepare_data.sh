#!/usr/bin/env bash

# To be run from one directory above this script.

. ./path.sh

# Prepare: test, train,
for set in dev test train; do
  dir=data/$set
  mkdir -p $dir

#   (cd ${mybuddy_db}/${mybuddy_collection_name} ; find data/$set -name "*.trn" -exec sh -c \
#     'NAME=`basename {} .trn`; DIR=`dirname {}`; FLAC="${DIR}/${NAME}.flac"; if [ -e ${FLAC} ] ; then echo "${FLAC}" ; fi ' \; ) \
#     | sort > $dir/audio_file_list.txt

  (cd ${mybuddy_db}/${mybuddy_collection_name} ; find data/$set -name "*.flac" ) \
    | sort > $dir/audio_file_list.txt

  local/data_preparation/prepare_data_files.pl "${mybuddy_db}/${mybuddy_collection_name}" \
    $dir audio_file_list.txt resources/transcriptions.txt
  cat $dir/utt2spk | utils/utt2spk_to_spk2utt.pl > $dir/spk2utt
  
  # Check that data dirs are okay!
  utils/validate_data_dir.sh --no-feats $dir || exit 1
done

