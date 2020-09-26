#!/bin/bash

# Task 2 C

# Giving better names to the CLI arguments
file="$1"
season="$2"
year="$3"

# sed -n -r "/$season/{/$year/ p}" $file
sed -n 1,3p $file # Print the header
sed -n -r "/$season/{/$year/ p}" $file | sort -k3 # Sort according to course code
