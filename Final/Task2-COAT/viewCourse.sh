#!/bin/bash

# Task 2 D

# Giving better names to the CLI arguments
file="$1"
course_code="$2"

# sed -n -r "/$course_code/ p" $file
sed -n 1,3p $file # Print the header
# According to the update, the query can only occur as a substring of the course codes
sed -n -r "/$course_code/ p" $file | sort -k3 # Sort according to course code
