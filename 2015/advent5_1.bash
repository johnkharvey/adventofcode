#!/bin/bash

FILE=./advent5_data.txt

nice=0

while read myline; do
  myline=`echo $myline | tr -d '\n'`
  echo $myline | grep 'ab\|cd\|pq\|xy' > /dev/null
  if [ $? -eq 0 ]; then
    echo "$myline - BROKEN (criteria 3) - ab/cd/pq/xy"
  else
    firstdone=0
    echo $myline | grep 'aa\|bb\|cc\|dd\|ee' > /dev/null
    if [ $? -eq 0 ]; then
      #echo "$myline - OK (criteria 2 - aa-ee)"
      firstdone=1
    fi
    echo $myline | grep 'ff\|gg\|hh\|ii\|jj' > /dev/null
    if [ $? -eq 0 ]; then
      #echo "$myline - OK (criteria 2 - ff-jj)"
      firstdone=1
    fi
    echo $myline | grep 'kk\|ll\|mm\|nn\|oo\|pp' > /dev/null
    if [ $? -eq 0 ]; then
      #echo "$myline - OK (criteria 2 - kk-pp)"
      firstdone=1
    fi
    echo $myline | grep 'qq\|rr\|ss\|tt\|uu' > /dev/null
    if [ $? -eq 0 ]; then
      #echo "$myline - OK (criteria 2 - qq-uu)"
      firstdone=1
    fi
    echo $myline | grep 'vv\|ww\|xx\|yy\|zz' > /dev/null
    if [ $? -eq 0 ]; then
      #echo "$myline - OK (criteria 2 - vv-zz)"
      firstdone=1
    fi
    if [ "$firstdone" == "1" ]; then
      done=0
      echo $myline | grep "[aeiou].*[aeiou].*[aeiou]" > /dev/null
      if [ $? -eq 0 ] && [ "$done" == "0" ] ; then
        echo "$myline - NICE"
        nice=$((nice + 1))
        done=1
      fi
      if [ "$done" == "0" ] ; then
          echo "$myline - BROKEN (criteria 1) - no 3 vowels"
      fi
    else
      echo "$myline - BROKEN (criteria 2) - no 2-letter pairs"
    fi
  fi
done < "$FILE"

echo "NICE items: $nice"

exit 0

