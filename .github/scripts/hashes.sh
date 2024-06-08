outfile="hashes.txt"

rm -rf $outfile | true

find * -type f -printf '%p\0' | sort | while read -d $'\0' -r file; do
    hash=`md5sum "$file" | awk '{print $1}'`
    echo "$file|$hash" >> "$outfile"
done

sort -o "$outfile" "$outfile"