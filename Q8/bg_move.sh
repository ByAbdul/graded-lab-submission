#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: ./bg_move.sh directory"
    exit 1
fi

dir=$1

if [ ! -d "$dir" ]; then
    echo "Error: Directory does not exist."
    exit 1
fi

mkdir -p "$dir/backup"

for file in "$dir"/*
do
    if [ -f "$file" ]; then
        mv "$file" "$dir/backup/" &
        echo "Moved $(basename "$file") with PID $!"
    fi
done

wait
echo "All files moved."
