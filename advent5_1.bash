#!/bin/bash

FILE=./advent5_data.txt

nice=0

while read myline; do
  myline=`echo $myline | tr -d '\n'`
  echo $myline | grep "ab\|cd\|pq\|xy" > /dev/null
  if [ $? -eq 0 ]; then
    echo "$myline - BROKEN (critieria 3)"
  else
    echo $myline | grep "aa\|bb\|cc\|dd\|ee\|ff\|gg\|hh\|ii\|jj\|kk\|ll\|mm\|nn\|oo\|pp\|qq\|rr\|ss\|tt\|uu\|vv\|ww\|xx\|yy\|zz" > /dev/null
    if [ $? -ne 0 ]; then
      echo "$myline - BROKEN (critieria 1)"
    else
      done=0
      echo $myline | grep "a" | grep "e" | grep "i" > /dev/null
      if [ $? -eq 0 ]; then
        echo "$myline - NICE (a,e,i)"
        nice=$((nice + 1))
        done=1
      fi
      echo $myline | grep "a" | grep "e" | grep "o" > /dev/null
      if [ $? -eq 0 ] && [ $done -ne 1 ] ; then
        echo "$myline - NICE (a,e,o)"
        nice=$((nice + 1))
        done=1
      fi
      echo $myline | grep "a" | grep "e" | grep "u" > /dev/null
      if [ $? -eq 0 ] && [ $done -ne 1 ] ; then
        echo "$myline - NICE (a,e,u)"
        nice=$((nice + 1))
        done=1
      fi
      echo $myline | grep "a" | grep "i" | grep "o" > /dev/null
      if [ $? -eq 0 ] && [ $done -ne 1 ] ; then
        echo "$myline - NICE (a,i,o)"
        nice=$((nice + 1))
        done=1
      fi
      echo $myline | grep "a" | grep "i" | grep "u" > /dev/null
      if [ $? -eq 0 ] && [ $done -ne 1 ] ; then
        echo "$myline - NICE (a,i,u)"
        nice=$((nice + 1))
        done=1
      fi
      echo $myline | grep "a" | grep "o" | grep "u" > /dev/null
      if [ $? -eq 0 ] && [ $done -ne 1 ] ; then
        echo "$myline - NICE (a,o,u)"
        nice=$((nice + 1))
        done=1
      fi
      echo $myline | grep "e" | grep "i" | grep "o" > /dev/null
      if [ $? -eq 0 ] && [ $done -ne 1 ] ; then
        echo "$myline - NICE (e,i,o)"
        nice=$((nice + 1))
        done=1
      fi
      echo $myline | grep "e" | grep "i" | grep "u" > /dev/null
      if [ $? -eq 0 ] && [ $done -ne 1 ] ; then
        echo "$myline - NICE (e,i,u)"
        nice=$((nice + 1))
        done=1
      fi
      echo $myline | grep "e" | grep "o" | grep "u" > /dev/null
      if [ $? -eq 0 ] && [ $done -ne 1 ] ; then
        echo "$myline - NICE (e,o,u)"
        nice=$((nice + 1))
        done=1
      fi
      echo $myline | grep "i" | grep "o" | grep "u" > /dev/null
      if [ $? -eq 0 ] && [ $done -ne 1 ] ; then
        echo "$myline - NICE (i,o,u)"
        nice=$((nice + 1))
        done=1
      fi
      if [ $done -ne 1 ]; then
          echo "$myline - BROKEN (criteria 2)"
      fi
    fi
  fi
done < "$FILE"

echo "NICE items: $nice"

exit 0

