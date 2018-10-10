#!/bin/bash
LOGFILE=./1652782-hw1-q3.log && \
lines=0

echo -e "\c" > $LOGFILE

echolog()
(
    echo "$1" >> "$LOGFILE"
)

for line in $(cat $1)
do 
	((lines++))
done
echolog `expr $lines / 11`

cut=0
average=0.0
for line in $(cat $1)
do 
	((cut++))
	if [ $cut == 1 ]
		then
		# echo $line
		line="2018-10-07 "$line
		# echo $line
		time1=$(date +%s -d "$line")
		# echo $time1 
	fi

	if [ $cut == `expr $lines - 10` ]
		then
		line="2018-10-07 "$line
		# echo $line
		time2=$(date +%s -d "$line")
		# echo $time2
	fi
	if [ `expr $(expr $cut - 10) % 11` == 0 ]
		then
		line=${line:0:4}
		average=`echo "$average+$line"|bc`
		# echo $average
	fi
done




let timed=$time2-$time1
echolog $timed
# $(printf "%.2f" `echo "scale=2;1/3"|bc`)
# echo $average
average=$(printf "%.4f" `echo "scale=15;$average/($lines/11)"|bc`)
# let average=$average/($lines/11)
echolog $average



primeArray=()
tt=1
for i in `seq 100`
do
    for((j=2;j<=i-1;j++))
    do
         [ $((i%j)) -eq 0 ] &&  break     
    done
    [ $j -eq $i ] && primeArray[tt]=$i && ((tt++))

done




 # echo ${primeArray[#]}
 # echo ${primeArray[@]}

# for i in $primeArray
# do
# 	echo ${primeArray[i]}
# # done
# cut=0
# i=0
# total=0
# for line in $(cat $1)
# do
# 	((cut++))
# 	# echo ${primeArray[i]}
# 	if [[ `expr ${primeArray[i]} \* 11` -ge $cut && `expr $\(expr ${primeArray[i]} \* 11\) + 11` -le $cut ]]
# 	then
# 		let total=$total+${#line}
# 		echo $total
# 	fi
# 	if [[ ($cut -gt `expr $(expr ${primeArray[i]} \* 11) + 11`) && ( $i -lt 26 ) ]]
# 	then
# 		((i++))
# 	fi
# done
# let total=$total+10*${#primeArray[@]} 

# echo $total

# echo ${#primeArray[@]}
cut=0
numTemp=1
sumLen=0
while read LINE
do
	let cut++
	if [[ $cut == ${primeArray[numTemp]} ]]
	then
		addTemp=${#LINE}
		let sumLen=$addTemp+$sumLen
		# echo $sumLen
		let numTemp++
	fi
done < $1
echolog $sumLen

exit 0