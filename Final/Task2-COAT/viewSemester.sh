#!/bin/bash

# Task 2 C

# Giving better names to the CLI arguments
file="$1"
season="$2"
year="$3"

# sed -n -r "/$season/{/$year/ p}" $file
sed -n 1,3p $file # Print the header
# As mentioned in the PS that there are no “Autumn” or “Spring” as a substring in the name of any course neither does the year match with any course code
sed -n -r "/$season/{/$year/ p}" $file | sort -k3 # Sort according to course code
