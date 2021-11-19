
#!/bin/bash
temp_ama=$(mktemp); 
temp_twi=$(mktemp); 
sed -r 's/(\s)+/\n/g' $1 | sort > $temp_ama; 
sed -r 's/(\s)+/\n/g' $2 | sort > $temp_twi; 
comm -12 $temp_ama $temp_twi | wc; 
rm $temp_ama; 
rm $temp_twi; 
