#!/usr/bin/env bash

. ./path.sh

mkdir -p ${mybuddy_db}

cd ${mybuddy_db}  ### Note: the rest of this script is executed from the directory 'db'.

if [ ! -e ${mybuddy_collection_name} ]; then
  if [ ! -e ${mybuddy_collection_name}.tar ]; then
    echo "$0: downloading data (it won't re-download if it was already downloaded.)"
    # the following command won't re-get it if it's already there
    # because of the --continue switch.
    # wget --continue http://www.openslr.org/resources/51/TEDLIUM_release-3.tgz || exit 1
  else
    echo "$0: not downloading or un-tarring ${mybuddy_collection_name} because it already exists."
  fi

  echo "$0: extracting ${mybuddy_collection_name} data"
  tar xf "${mybuddy_collection_name}.tar"
else
  echo "$0: not downloading or un-tarring ${mybuddy_collection_name} because it already exists."
fi

# rename the folder 
if [ -e ${mybuddy_collection_name}/data/development ]; then
  mv ${mybuddy_collection_name}/data/development ${mybuddy_collection_name}/data/dev
fi

# num_sph=$(find ${mybuddy_collection_name}/data -name '*.sph' | wc -l)
# if [ "$num_sph" != 2351 ]; then
#   echo "$0: expected to find 2351 .sph files in the directory db/${mybuddy_collection_name}, found $num_sph"
#   exit 1
# fi

exit 0

