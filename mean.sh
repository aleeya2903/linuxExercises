#!/bin/bash 

if [ $# -lt 1 ]; then
    echo "usage: $0 <column> [file.csv]" >&2
    exit 1
fi

column="$1"
file="${2:-/dev/stdin}"  

cut -d ',' -f "$column" "$file" | tail -n +2 | {
    sum=0
    count=0
    while read value; do
        sum=$(echo "$sum + $value" | bc)
        count=$((count + 1))
    done

    if [ "$count" -eq 0 ]; then
        echo "Error: No data found in column $column." >&2
        exit 1
    fi

    mean=$(echo "scale=2; $sum / $count" | bc)
    echo "$mean"
}
