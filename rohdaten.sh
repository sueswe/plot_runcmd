#!/bin/bash

programm=$1
if [[ -z $programm ]]; then
  echo "Usage: $0 programmname"
  exit 1
fi

mkdir data || echo "data-dir vorhanden"
cd data || exit 2


function step_a() {
  echo "generating data file ..."
  if [ -f ${programm}.data ]; then
    echo "data-file already exists."
  else
    grep -i $programm runcmd_202?-*.csv |sed 's/ //g' > ${programm}.data || {
    exit 3
   }
 fi
 echo "done."
}

function step_b() {
  echo "generating csv file ..."
  grep $programm ${programm}.data |  sed 's/t(s)://g' | awk -F';' '{print $2 " ; " $6  }' > x-y.csv || {
    exit 4
  }
  echo "done"
}


step_a
step_b


echo "finished preprocessing."
exit 0
