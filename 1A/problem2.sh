#!/bin/bash

for arg in $@; do
	case $arg in
		fancy)
			echo "Oh"
			;;
		pants)
			echo "yes!"
			;;
	esac
done


