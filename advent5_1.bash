#!/bin/bash

FILE=./advent5_data.txt

nice=0

while read myline; do
  myline=`echo $myline | tr -d '\n'`
  echo $myline | grep 'ab\|cd\|pq\|xy' > /dev/null
  if [ $? -eq 0 ]; then
    echo "$myline - BROKEN (criteria 3)"
  else
    firstdone=0
    echo $myline | grep 'aa\|bb\|cc\|dd\|ee' > /dev/null
    if [ $? -eq 0 ]; then
      echo "$myline - OK (criteria 2 - aa-ee)"
      firstdone=1
    fi
    echo $myline | grep 'ff\|gg\|hh\|ii\|jj' > /dev/null
    if [ $? -eq 0 ]; then
      echo "$myline - OK (criteria 2 - ff-jj)"
      firstdone=1
    fi
    echo $myline | grep 'kk\|ll\|mm\|nn\|oo\|pp' > /dev/null
    if [ $? -eq 0 ]; then
      echo "$myline - OK (criteria 2 - kk-pp)"
      firstdone=1
    fi
    echo $myline | grep 'qq\|rr\|ss\|tt\|uu' > /dev/null
    if [ $? -eq 0 ]; then
      echo "$myline - OK (criteria 2 - qq-uu)"
      firstdone=1
    fi
    echo $myline | grep 'vv\|ww\|xx\|yy\|zz' > /dev/null
    if [ $? -eq 0 ]; then
      echo "$myline - OK (criteria 2 - vv-zz)"
      firstdone=1
    fi
    if [ "$firstdone" == "1" ]; then
      done=0
      echo $myline | grep "a" | grep "e" | grep "i" > /dev/null
      if [ $? -eq 0 ] && [ "$done" == "0" ] ; then
        echo "$myline - NICE (a,e,i)"
        nice=$((nice + 1))
        done=1
      fi
      echo $myline | grep "a" | grep "e" | grep "o" > /dev/null
      if [ $? -eq 0 ] && [ "$done" == "0" ] ; then
        echo "$myline - NICE (a,e,o)"
        nice=$((nice + 1))
        done=1
      fi
      echo $myline | grep "a" | grep "e" | grep "u" > /dev/null
      if [ $? -eq 0 ] && [ "$done" == "0" ] ; then
        echo "$myline - NICE (a,e,u)"
        nice=$((nice + 1))
        done=1
      fi
      echo $myline | grep "a" | grep "i" | grep "o" > /dev/null
      if [ $? -eq 0 ] && [ "$done" == "0" ] ; then
        echo "$myline - NICE (a,i,o)"
        nice=$((nice + 1))
        done=1
      fi
      echo $myline | grep "a" | grep "i" | grep "u" > /dev/null
      if [ $? -eq 0 ] && [ "$done" == "0" ] ; then
        echo "$myline - NICE (a,i,u)"
        nice=$((nice + 1))
        done=1
      fi
      echo $myline | grep "a" | grep "o" | grep "u" > /dev/null
      if [ $? -eq 0 ] && [ "$done" == "0" ] ; then
        echo "$myline - NICE (a,o,u)"
        nice=$((nice + 1))
        done=1
      fi
      echo $myline | grep "e" | grep "i" | grep "o" > /dev/null
      if [ $? -eq 0 ] && [ "$done" == "0" ] ; then
        echo "$myline - NICE (e,i,o)"
        nice=$((nice + 1))
        done=1
      fi
      echo $myline | grep "e" | grep "i" | grep "u" > /dev/null
      if [ $? -eq 0 ] && [ "$done" == "0" ] ; then
        echo "$myline - NICE (e,i,u)"
        nice=$((nice + 1))
        done=1
      fi
      echo $myline | grep "e" | grep "o" | grep "u" > /dev/null
      if [ $? -eq 0 ] && [ "$done" == "0" ] ; then
        echo "$myline - NICE (e,o,u)"
        nice=$((nice + 1))
        done=1
      fi
      echo $myline | grep "i" | grep "o" | grep "u" > /dev/null
      if [ $? -eq 0 ] && [ "$done" == "0" ] ; then
        echo "$myline - NICE (i,o,u)"
        nice=$((nice + 1))
        done=1
      fi
      if [ "$done" == "0" ] ; then
          echo "$myline - BROKEN (criteria 1)"
      fi
    else
      echo "$myline - BROKEN (criteria 2)"
    fi
  fi
done < "$FILE"

echo "NICE items: $nice"

exit 0

