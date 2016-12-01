#!/bin/bash
# data file
INPUT=advent1_data.txt

count=0
position=0
 
while IFS= read -r -n1 char
do
  count=$((count + 1))
  # display one character at a time
  if [[ $char == "(" ]]; then
    echo  "$char"
    position=$((position + 1))
    echo $position
  fi
  if [[ $char == ")" ]]; then
    echo  "$char"
    position=$((position - 1))
    echo $position
  fi
  if [[ $position -eq -1 ]]; then
    echo $count
    exit 0
  fi
done < "$INPUT"
