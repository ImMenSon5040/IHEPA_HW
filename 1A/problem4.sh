#!/bin/bash

if [[ $# -ne 2 ]];
then
	option="help"
else
	option=$1
fi


case $option in
	help | -h)
		echo "problem4.sh [options]"
		echo "OPTIONS"
		echo -ne "\t-dt, date ['date']\n\t\tcheckout commit on a given date\n"
		echo -ne "\t-nb, number [N]\n\t\tcheckout the N-th commit\n"
		echo -ne "\t-n, new-branch [branch name]\n\t\tcreate new branch\n"
		echo -ne "\t-d, del-branch [branch name]\n\t\tdelete specified branch\n"
		echo -ne "\t-s, sel-branch [branch name]\n\t\tswich to specified branch\n"
		;;
	date | -dt)
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
	number | -nb)
		IFS=$'\n'

		commits=( $(git log | grep "commit") )

		git checkout ${commits[-$2]#commit }
		;;
	new-branch | -n)
		git branch $2
		;;
	del-branch | -d)
		git branch -d $2
		;;
	sel-branch | -s)
		git checkout $2
		;;
	*)
		echo "$option is not a recognized option"
		echo "use 'problem4.sh help' to see how to use it"
esac
