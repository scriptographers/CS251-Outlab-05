#!/bin/bash

# Task 2 D

# Giving better names to the CLI arguments
file="$1"
course_code="$2"

# sed -n -r "/$course_code/ p" $file
sed -n 1,3p $file # Print the header
sed -n -r '/(Autumn|Spring)\s+[A-Za-z0-9 ]{0,20}('"$course_code"')/ p' $file | sort -k3
