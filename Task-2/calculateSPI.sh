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
            # printf $2 "\n"
        }
    }
    # File 2
    else {
        if (FNR > 1) {
            if ($2 == season && $1 == year) {
                # print $7, grade[$7]
                points += $5 * grade[$7]
                credits += $5
            }
        }
    }
}
END {
    # print credits "\n" points
    # printf points/credits
    printf "%.4f\n", points/credits
}
' $file2 $file1
