outfile="hashes.txt"

echo Sanity check 1

[ -e "$outfile" ] && rm "$outfile"

echo Sanity check 2

find . -type f | while read -r file; do
    # Generate MD5 hash for the file
    hash=`md5sum "$file" | awk '{print $1}'`
    
    # Print file name and hash to the output file
    echo "[DEBUG]: $file"
    echo "${file:2}?$hash" >> "$outfile"
done