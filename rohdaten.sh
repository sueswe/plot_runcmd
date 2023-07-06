#!/bin/bash

programm=$1
if [[ -z $programm ]]; then
  echo "Usage: $0 programmname"
  exit 1
fi

mkdir data || echo "data-dir vorhanden"
cd data || exit 2
grep -i $programm runcmd_2023-*.csv |sed 's/ //g' > ${programm}.data || exit 3
grep $programm ${programm}.data |  sed 's/t(s)://g' | awk -F';' '{print $2 " ; " $6  }' > x-y.csv || exit 4

exit 0
