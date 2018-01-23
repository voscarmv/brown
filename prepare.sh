#!/bin/bash

echo 'Download the Brown corpus from the University of Hawaii'
wget -O brown.txt http://www.sls.hawaii.edu/bley-vroman/browntag_nolines.txt
echo 'Get a list of all Parts Of Speech (P.O.S.) tags in the corpus (the tags for the grammatical categories)'
# Note: had to replace some special characters ($, *, +) in the original P.O.S. tags so I could later use the tags with posix grep.
# Replaced '$' with 's', '*' with 'x' and '+' with 't'.
cat brown.txt | \
	sed 's/\r/\n/g' | \
	sed 's/[ ][ ]*/\n/g' | \
	sed 's/[^_][^_]*//' | \
	sed '/^$/d' | \
	sed 's/\$/s/g;s/*/x/g;s/+/t/g' | \
	sort -u > grammatical_categories.txt
echo 'Get the list of all the words in the Brown corpus, each word marked with their P.O.S. tag'
cat brown.txt | \
	sed 's/[ ][ ]*/\n/g' | \
	sed '/^$/d' | \
	sed 's/\$/s/g;s/*/x/g;s/+/t/g' > words_by_gc.txt
echo 'For each P.O.S. tag, create a file and fill that file with all the words from the corpus which correspond to it'
cat grammatical_categories.txt | while read GRAMCAT ; do
	echo "$GRAMCAT"
	grep "$GRAMCAT"'$' words_by_gc.txt | sed 's/_.*//' > "$GRAMCAT"'.gcat.txt'
	# You can use sort -u to give each word equal probability of showing up in the generated sentences, but this makes them sort of unreadeble
	# If you want to do that just comment the previous line and uncomment this one:
	# grep "$GRAMCAT"'$' words_by_gc.txt | sed 's/_.*//' | sort -u > "$GRAMCAT"'.gcat.txt'
done
