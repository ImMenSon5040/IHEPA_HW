#!/bin/bash

IFS=$'\n'

commits=( $(git log | grep "commit") )


case $1 in
	date)
		my_date=$2
		dates=( $(git log | grep "Date:") )

		for ((i=0 ; i< ${#commits[@]} ; i++));
		do
			if [[ $my_date == ${dates[$i]#Date:   } ]];
			then
				git checkout ${commits[$i]#commit }
			fi
		done
		;;
	number)
		index=$(echo "-$2")
		git checkout ${commits[$index]#commit }
esac
