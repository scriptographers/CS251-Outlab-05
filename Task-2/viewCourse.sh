#!/bin/bash

# Task 2 D

# Giving better names to the CLI arguments
file="$1"
course_code="$2"

# sed -n -r "/$course_code/ p" $file
sed -n 1,3p $file # Print the header

# Check whether with or without color
s=$(awk '
BEGIN {
    FS = " "
    RS = "\n"
}
END {
    if (NF==8) {
        print 0 # without color
    }
    else {
        print 1 # with color
    }
}
' $file)

# According to the update, the query can only occur as a substring of the course codes
if [[ $s == 1 ]]; then
    sed -n -r "/$course_code/ p" $file | sort -k4 # Sort according to course code
else
    sed -n -r "/$course_code/ p" $file | sort -k3 # Sort according to course code
fi
