#!/bin/bash

FILE=./advent2_data.txt

total=0

while read -r myline; do
    myline=`echo $myline | tr -d '\n'`
    echo $myline

    IFS='x' read -ra ADDR <<< "$myline"
    len=`echo ${ADDR[0]}`
    width=`echo ${ADDR[1]}`
    height=`echo ${ADDR[2]}`

    # Find smallest
    if [ $((len)) -gt $((width)) ]; then
        # len is highest so far
        if [ $((len)) -gt $((height)) ]; then
            # Len is highest
            subtotal=$((2*len*width + 2*width*height + 2*len*height + width*height))
            echo $subtotal
            total=$((total + subtotal))
        else
            # height is highest
            subtotal=$((2*len*width + 2*width*height + 2*len*height + len*width))
            echo $subtotal
            total=$((total + subtotal))
        fi
    else
        # width is highest so far
        if [ $((width)) -gt $((height)) ]; then
            # width is highest
            subtotal=$((2*len*width + 2*width*height + 2*len*height + len*height))
            echo $subtotal
            total=$((total + subtotal))
        else
            # height is highest
            subtotal=$((2*len*width + 2*width*height + 2*len*height + len*width))
            echo $subtotal
            total=$((total + subtotal))
        fi
    fi
done < "$FILE"

echo "TOTAL: " $total

# 1598415 correct

exit 0
