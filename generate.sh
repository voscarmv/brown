#!/bin/bash

#!/bin/bash

END=$1

echo '** You have selected sentence number '"$1"' from the Brown corpus.'
echo
echo '* Untagged sentence from the Brown corpus: '
echo
sed -n "$1"'p' brown.txt | sed 's/_[^ ][^ ]*//g'
echo
echo '* Sentence with P.O.S. tags: '
echo
sed -n "$1"'p' brown.txt
echo
echo '* Sentence with all words replaced by randomly selected words of the same grammatical category: '
echo
sed -n "$1"'p' brown.txt | \
	sed 's/[^ ][^ ]*_/_/g' | \
	sed 's/\$/s/g;s/*/x/g;s/+/t/g' | \
	sed 's/\r/\n/g' | \
	sed '/^$/d' | \
	sed 's/[ ][ ]*/\n/g' | while read GRAMCAT ; do 
		shuf -n 1 "$GRAMCAT"'.gcat.txt'
	done | tr '\n' ' '
printf '\n'
