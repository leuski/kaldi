#!/usr/bin/env bash

# To be run from one directory above this script.

. ./path.sh

stage=0

mkdir -p data/local
cp -Rf resources/dict data/local/dict_nosp

