#!/usr/bin/env bash

# To be run from one directory above this script.

. ./path.sh

stage=0

if [ $stage -le 0 ]; then
  local/data_preparation/collect_transcriptions.sh
fi

# Prepare: test, train,
for set in dev test train; do
  dir=data/$set
  mkdir -p $dir

  (cd ${mybuddy_db}/${mybuddy_collection_name} ; find data/$set -name "*.flac" ) \
    | sort > $dir/audio_file_list.txt

  local/data_preparation/prepare_data_files.pl "${mybuddy_db}/${mybuddy_collection_name}" \
    $dir audio_file_list.txt data/transcriptions.txt
    
  cat $dir/utt2spk | utils/utt2spk_to_spk2utt.pl > $dir/spk2utt
  
  # Check that data dirs are okay!
  utils/validate_data_dir.sh --no-feats $dir || exit 1
done

