#!/bin/bash

# Task 2 D

# Giving better names to the CLI arguments
file1="$1"
file2="$2"

# awk letter_to_grade=$file2 '
# BEGIN {
#     FS = ","
#     RS = "\r\n"
# }
# {
#     sed -n -r "2,${/"$4"/ s/"$4"// p}" $letter_to_grade
# }
# ' $file1

awk '
BEGIN {
    FS = ","
    RS = "\r\n"
}
{
    system("sed -n -r '"'"'2,${/"$7"/ s/\n// p}'"'"' ./resources/letterGradeToNumber.csv")
}
' $file1 > x

awk -F, '{print $2}' x

