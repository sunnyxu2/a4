#!/bin/bash

for FILE in $1/*.txt; 
do 
	temp_ama=$(mktemp); 
	temp_twi=$(mktemp); 
	cut -f $3 $FILE | sed -r 's/(\s)+/\n/g' | sort > $temp_ama; 
	cut -f $4 $2 | sed -r 's/(\s)+/\n/g' | sort > $temp_twi; 
	comm -12 $temp_ama $temp_twi | wc; 
	rm $temp_ama; 
	rm $temp_twi; 
done
