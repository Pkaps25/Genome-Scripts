grep 'Mycobacter'  assembly_summary.txt | grep 'Complete Genome' | awk 'BEGIN{FS="\t"}{print $8"\t"$20}'     | awk 'BEGIN{OFS=FS="/"}{print $0,$NF"_assembly_stats.txt"}'     > urls.txt

sed 's/ /_/g' urls.txt | awk '{print $1}' | cut -d '_' -f 1,2 > species.txt

while read line; 
do 
	dir=$(echo "$line" | awk '{print $1"_"$2}')
	if [ -d "$dir" ]; 
	then
		echo "$dir" 
	else
		mkdir "$dir" 
	fi 
	link=$(echo "$line" | awk -F "\t" '{print $2}')
	wget "$link" && mv GCF* "$dir"
done <urls.txt



