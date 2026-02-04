#!/bin/bash

words=$(tr -c 'a-zA-Z' '\n' < input.txt | tr 'A-Z' 'a-z')

longest=$(echo "$words" | awk '{ if (length($0) > max) { max=length($0); word=$0 } } END { print word }')

shortest=$(echo "$words" | awk 'NR==1 { min=length($0); word=$0 } { if (length($0) < min) { min=length($0); word=$0 } } END { print word }')

avg=$(echo "$words" | awk '{ total+=length($0); count++ } END { print total/count }')

unique=$(echo "$words" | sort | uniq | wc -l)

echo "Longest word: $longest"
echo "Shortest word: $shortest"
echo "Average word length: $avg"
echo "Unique words count: $unique"
