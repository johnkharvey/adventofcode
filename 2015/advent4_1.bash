#!/bin/bash

test1="abcdef"
test2="pqrstuv"
test3="yzbqklnj"

count=0
position=0
 
#while  :
#do
#  count=$((count + 1))
#  myMd5=`md5 -q -s "$test1$count"`
#  echo $myMd5 | grep "^00000"
#  if [ $? -eq 0 ]; then
#    echo "Found it"
#    echo "md5 -q -s $test1$count"
#    echo $myMd5
#    echo $count
#    exit 0
#  fi
#  echo $count
#done

while  :
do
  count=$((count + 1))
  myMd5=`md5 -q -s "$test3$count"`
  echo $myMd5 | grep "^00000"
  if [ $? -eq 0 ]; then
    echo "Found it"
    echo "md5 -q -s $test3$count"
    echo $myMd5
    echo $count
    exit 0
  fi
  echo $count
done
