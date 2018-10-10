#!/bin/bash
ans=0
LOGFILE=./1652782-hw1-q1.log && \
echolog()
(
    echo "$1" >> "$LOGFILE"
)
for i in `seq 100`
do
    for((j=2;j<=i-1;j++))
    do
         [ $((i%j)) -eq 0 ] &&  break     
    done
         [ $j -eq $i ] &&  ans=$[i+ans]    
done
echolog $ans