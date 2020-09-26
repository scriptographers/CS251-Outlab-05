#!/bin/bash

# Task 1

if [ $# -ne 3 ]; then # '$#' gives the number of command line args supplied
    echo 'Usage: ./realestate.sh <file1> <file2> <file3>'
    exit 1 # Exit if the number of arguments aren't 3.
fi

# Giving better names to the CLI arguments
csv_file="$1"
file2="$2"
file3="$3"

# Awk
awk '
BEGIN {
    FS = ","
    RS = "\n"
}
{
    profit=0
    base_rate=$4
    maintainance=$6
    area=0.9*$2
    for (i = 0; i < $3; i++) {
        profit += 12*int(area*base_rate - maintainance);
        base_rate += int((base_rate*$5) / 100);
    }
    print $1 "," profit "," $3
}
' ${csv_file} | sort --field-separator="," -n -k3 | sort --field-separator="," -n -rk2,2 >${file2}

awk -F, '{print $1}' ${file2} >${file3}
# cat ${file2} ${file3}
