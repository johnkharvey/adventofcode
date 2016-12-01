#!/bin/bash

# data file
INPUT=advent1_data_sorted.txt

# Directions:
direction=0
# 0 = north
# 1 = east
# 2 = south
# 3 = west
# Turning right increments, turning left decrements

ARRAY=(0 0 0 0)

while IFS='' read -r line || [[ -n "$line" ]]; do

    #echo "$line"

    distance=$(echo "${line/L/}")
    distance=$(echo "${distance/R/}")
    #echo $distance
    
    if [[ "$line" == L* ]] ; then
       #echo "left"
       if [ $direction == 0 ] ; then
           direction=4
       fi
       direction=$((direction - 1))
       my_element=$(echo ${ARRAY[$direction]})
       my_sum=$((my_element + distance))
       ARRAY[$direction]=$my_sum

    elif [[ "$line" == R* ]] ; then
       #echo "right"
       direction=$((direction + 1))
       if [ $direction == 4 ] ; then
           direction=0
       fi
       my_element=$(echo ${ARRAY[$direction]})
       my_sum=$((my_element + distance))
       ARRAY[$direction]=$my_sum
    else
       echo "BAD DATA!"
       exit 1
    fi
done < "$INPUT"

echo ${ARRAY[0]} : NORTH
echo ${ARRAY[1]} : EAST
echo ${ARRAY[2]} : SOUTH
echo ${ARRAY[3]} : WEST

#306 : NORTH
#314 : EAST
#176 : SOUTH
#192 : WEST

# Now we need to get (ABS (N-S)) + ((ABS (E-W))
my_vert1=$(echo ${ARRAY[0]})
my_vert2=$(echo ${ARRAY[2]})
vert_diff=$((my_vert1 - my_vert2))
vert_diff=$(echo "${vert_diff/-/}")
#echo $vert_diff

my_horiz1=$(echo ${ARRAY[1]})
my_horiz2=$(echo ${ARRAY[3]})
horiz_diff=$((my_horiz1 - my_horiz2))
horiz_diff=$(echo "${horiz_diff/-/}")
#echo $horiz_diff

# Now we add (130+122 = 252):
sum=$((horiz_diff + vert_diff))
echo "==========="
echo $sum : TOTAL
