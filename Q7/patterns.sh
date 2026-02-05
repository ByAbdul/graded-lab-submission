#!/bin/bash

tr -c 'a-zA-Z' '\n' < input.txt | tr 'A-Z' 'a-z' > words.txt

grep -E '^[aeiou]+$' words.txt > vowels.txt
grep -E '^[^aeiou]+$' words.txt > consonants.txt
grep -E '^[^aeiou][a-z]*[aeiou][a-z]*$' words.txt > mixed.txt

echo "Patterns separated into vowels.txt, consonants.txt and mixed.txt"
