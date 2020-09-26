#!/bin/bash

# Task 2B

RAW=$1   # The raw, uncoloured input
GUIDE=$2 # The color guide

# A bash string that stores the sed commands created by AWK
SED_COMMANDS=$( awk -v RAW=$RAW '
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
' $GUIDE )

eval "$SED_COMMANDS"