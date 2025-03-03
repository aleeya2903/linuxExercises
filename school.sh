#!/bin/bash

cat Property_Tax_Roll.csv | \
grep "MADISON SCHOOLS" | \
cut -d',' -f7 | \
{
    total=0
    count=0
    while read value; do
        total=$((total + value))
        count=$((count + 1))
    done
    
    average=$(echo "$total / $count" | bc -l)
    echo "Total value for MADISON SCHOOLS: $total"
    echo "Average value for MADISON SCHOOLS: $average"
    
}
