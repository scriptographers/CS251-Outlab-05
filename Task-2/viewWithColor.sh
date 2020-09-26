#!/bin/bash

# Task 2 B

RAW=$1   # The raw, uncoloured input
GUIDE=$2 # The color guide

awk -v RAW=$RAW '
BEGIN {
    FS = ","
    RS = "\r\n"
    printf("#!/bin/bash \n")
    printf("source ./resources/defineColors.sh \n")
    printf("sed -n -r ")
}
{
    if (NR > 1) { # Exclude first header row
        font = $3"_FONT"
        bg   = $4"_BACKGROUND"
        # Append font colour and BG color to the start of the line containing the fields
        printf("-e \"/"$1"/ s/^/\"${"bg"}${"font"}\"/\" ")
    }
}
END {
    # Reset all colours before printing
    printf("-e \"4,$ s/$/\"${RESET_ALL}\"/ p\" -e \"1,3 p\" "RAW)
}
' $GUIDE >task_2_temp_file_1 # Redirect to temporary file "y"

bash task_2_temp_file_1 # This executes the sed commands inside "y"

rm -rf task_2_temp_file_1 # Remove temp file after execution
