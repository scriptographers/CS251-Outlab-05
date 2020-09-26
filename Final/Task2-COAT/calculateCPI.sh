#!/bin/bash

# Task 2 E

# Giving better names to the CLI arguments
file1="$1"
file2="$2"

awk '
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
            # print $7, grade[$7]
            points += $5 * grade[$7]
            credits += $5
        }
    }
}
END {
    if (credits > 0){ # Check for division by 0
        printf "%.4f\n", points/credits
    }
    else{
        printf "0.0\n"
    }
}
' $file2 $file1
