#!/bin/bash

mkdir five

for i in {1..5}; do
    dir_name="five/dir$i"
    mkdir "$dir_name"
    for j in {1..4}; do
	file_name="$dir_name/file$j"
	for ((k=1; k<=j; k++)); do
	    echo "$j" >> "$file_name"
	done
    done
done
    
