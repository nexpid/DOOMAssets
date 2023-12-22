outfile="hashes.txt"

[ -e "$outfile" ] && rm "$outfile"

find . -type f | while read -r file; do
    # Generate MD5 hash for the file
    hash=$(md5sum "$file" | awk '{print $1}')
    
    # Print file name and hash to the output file
    echo "${file:2}:$hash" >> "$outfile"
done