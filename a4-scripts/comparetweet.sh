#!/bin/bash
temp_ama=$(mktemp); 
temp_twi=$(mktemp); 
name=`echo $1`
sed -r 's/(\s)+/\n/g' $name.TRIMMED.txt | sed -r '/^$/d' | sort > $temp_ama; 
sed -r 's/(\s)+/\n/g' $name.TWEETS.txt | sed -r '/^$/d' | sort > $temp_twi; 
comm -12 $temp_ama $temp_twi;
echo "did something";
rm $temp_ama; 
rm $temp_twi;
