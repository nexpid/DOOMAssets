outfile="hashes.txt"

[ -e "$outfile" ] && rm "$outfile"

find . -type f | while read -r file; do
    hash=`md5sum "$file" | awk '{print $1}'`
    echo "$file?$hash" >> "$outfile"
done