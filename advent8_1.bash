#!/bin/bash

FILE=./advent8_data.txt

totalcharcount=0
memorycharcount=0

while read -r myline; do
    myline=`echo $myline | tr -d '\n'`
    echo $myline
    this_line_charcount=${#myline}
    totalcharcount=$((totalcharcount + $this_line_charcount))

    # Make sure they all end / start with "
    this_line_firstChar=`echo ${myline:0:1}`
    this_line_lastChar=`echo ${myline:$((this_line_charcount - 1)):1}`
    if [[ "$this_line_firstChar" != "\"" ]] || [[ "$this_line_lastChar" != "\"" ]]; then
        echo "malformed strings"
        exit 1
    fi

    # Strip the ends
    myline=`echo ${myline:1:$((this_line_charcount - 2))}`
    echo $myline

    # Replace the \xab's with B
    myline=`echo ${myline//\\\x[a-f|0-9][a-f|0-9]/B}`
    echo $myline

    # Replace the \" with C
    myline=`echo ${myline//\\\\\"/C}`
    echo $myline

    # Replace the \\ with D
    myline=`echo ${myline//\\\\\\\/D}`
    echo $myline

    this_memory_charcount=${#myline}
    memorycharcount=$((memorycharcount + $this_memory_charcount))

done < "$FILE"

echo "TOTAL: " $totalcharcount
echo "MEMORY: " $memorycharcount
echo "WASTED SPACE: " $((totalcharcount - $memorycharcount))

exit 0
