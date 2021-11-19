echo "format: <column list> <sort column> <col to name files> <num results>"
read col_list sort_col name_col lim
cut -f $col_list $1 | sort -k $sort_col -n -r | head -n $lim | awk -v name=$name_col -v folder=$2 '{ print > folder"/"$name".txt" }'
