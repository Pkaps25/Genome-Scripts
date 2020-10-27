for DIR in $(find . -maxdepth 1 -mindepth 1 -type d); do 
	for file in "$DIR"/*; do
		num=$(grep 'total-length' "$file" | awk '$1 == "all" {print $6}')
		echo "$file""|""$num"
	done
done >> lengths.txt
 
