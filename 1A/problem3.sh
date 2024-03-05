#!/bin/bash

IFS=$'\n'

commits=( $(git log | grep "commit") )


my_date=$1
dates=( $(git log | grep "Date:") )

echo ${#commits[@]}
for ((i=0 ; i< ${#commits[@]} ; i++));
do
	echo $i
	echo ${dates[$i]#Date:   }
	if [[ $my_date == ${dates[$i]#Date:   } ]];
	then
		git checkout ${commits[$i]#commit }
	fi
done

