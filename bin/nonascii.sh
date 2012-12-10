# Search for lines with non-ascii characters.
grep -P -n "[\x80-\xFF]" $*
