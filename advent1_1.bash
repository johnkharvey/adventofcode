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
    position=$((position + 1))
  fi
  if [[ $char == ")" ]]; then
    position=$((position - 1))
  fi
done < "$INPUT"
echo $position
