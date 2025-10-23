#!/bin/bash

script_dir="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
source "$script_dir/common.sh"

if [[ $checkout_upmem -eq 1 ]]; then
  if [ ! -d "$upmem_path" ]; then
    status "Downloading UpMem SDK"
    upmem_archive="third-party/upmem-2025.1.0-Linux-x86_64.tar.gz"
    mkdir "$upmem_path"
    tar -xvf "$upmem_archive" -C "$upmem_path" --strip-components=1
  fi
elif [[ $checkout_upmem -eq 0 ]]; then
  warning "Skipping UpMem checkout"
  warning "The following steps will need UPMEM_DIR to be set in their respective <STEP>_CMAKE_OPTIONS"
fi
