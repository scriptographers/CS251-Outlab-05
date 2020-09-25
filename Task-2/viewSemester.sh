#!/bin/bash

# Task 2 C

# Giving better names to the CLI arguments
file="$1"
season="$2"
year="$3"

# sed -n -r "/$season/{/$year/ p}" $file
sed -n -r "/$season/{/$year/ p}" $file | sort -k 4,5
