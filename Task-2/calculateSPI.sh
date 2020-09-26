#!/bin/bash

# Task 2 F

# Giving better names to the CLI arguments
file1="$1"
file2="$2"

awk -v season=$3 -v year=$4 '
BEGIN {
    FS = ","
    RS = "\r\n"
    points = 0
    credits = 0
}
{
    # File 1
    if (FNR == NR) {
        if (FNR > 1) {
            grade[$1] = int($2)
        }
    }
    # File 2
    else {
        if (FNR > 1) {
            if ($2 == season && $1 == year) {
                points += $5 * grade[$7]
                credits += $5
            }
        }
    }
}
END {
    if (credits > 0){
        printf "%.4f\n", points/credits
    }
}
' $file2 $file1
