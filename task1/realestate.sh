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
awk -v q="'" -F ',' '
BEGIN {}
{profit=0}
{rate=$4}
{maintainance=$6}
{area=0.9*$2}
{
    for (i = 0; i < $3; i++) {
        profit += (area*rate - maintainance);
        rate += (rate*$5) / 100;
    }
}
{print $1 "," profit "," $3}
# {print profit}
' ${csv_file}

sort -n -k 2 x >y
