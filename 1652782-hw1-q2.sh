#!/bin/bash
LOGFILE=./1652782-hw1-q2.log && \
for i in `seq 100`
do
    for((j=1;j<=i;j++))
    do
    	uptime>>"$LOGFILE"
    	sleep 10
    done
done
