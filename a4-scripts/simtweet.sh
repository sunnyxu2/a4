#!/bin/bash
temp_ama=$(mktemp); 
temp_twi=$(mktemp); 
twi_len=`wc -l $2 | cut -d " " -f 1`
sed -r 's/(\s)+/\n/g' $1 | sed -r '/^$/d' | sort > $temp_ama; 
for (( i = 1; i <= 100; i++ ))
do
	temp_twi_line=$(mktemp);
	curr_tweet=`sed "${i}q;d" $2`;
	echo $curr_tweet | sed -r 's/(\s)+/\n/g' | sed -r '/^$/d' | sort > $temp_twi_line;
	shared_words=`comm -12 $temp_ama $temp_twi_line | wc -l`;
	new_file_name=`basename $1 | cut -d "." -f 1`;
	file_dir=`dirname $1`
	touch $file_dir/$new_file_name.TWEETS.txt
	if (($shared_words>=2));
	then
		echo $curr_tweet >> $file_dir/$new_file_name.TWEETS.txt ;
	fi
	rm $temp_twi_line
done
rm $temp_ama; 

