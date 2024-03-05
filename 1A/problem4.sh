#!/bin/bash


case $1 in
	date)
		IFS=$'\n'

		commits=( $(git log | grep "commit") )

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
		IFS=$'\n'

		commits=( $(git log | grep "commit") )

		index=$(echo "-$2")
		git checkout ${commits[$index]#commit }
		;;
	new-branch)
		git branch $2
		;;
	del-branch)
		git branch -d $2
		;;
	sel-branch)
		git checkout $2
		;;
	*)
		echo "problem3.sh [options]"
		echo "OPTIONS"
		echo "	date ['date']	checkout commit on a given date"
		echo "	number [N]	checkout the N-th commit"
esac
