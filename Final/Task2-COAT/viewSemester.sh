#!/bin/bash

# Task 2 C

# Giving better names to the CLI arguments
file="$1"
season="$2"
year="$3"

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

# As mentioned in the PS that there are no “Autumn” or “Spring” as a substring in the name of any course neither does the year match with any course code
if [[ $s == 1 ]]; then
    sed -n -r "/$season/{/$year/ p}" $file | sort -k4 # Sort according to course code
else
    sed -n -r "/$season/{/$year/ p}" $file | sort -k3 # Sort according to course code
fi
