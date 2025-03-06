#!/bin/bash

num=$(echo {1000..2000})

sum=0

for n in $num;do if [[ "$n" =~ ^[01]+$ ]]; then
    sum=$(($sum + $n))    
    fi
done

echo $sum

