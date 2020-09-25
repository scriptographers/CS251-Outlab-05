#!/bin/bash

source ./resources/defineColors.sh # Loading in the bash color variables

RAW=$1
GUIDE=$2

# Search "Tag" in RAW
# Search GUIDE for the respective Tag / Use an associative array to store the data
# FONT_COLOR[tag] = ...
# Replace the field by $COLOR $BG_COLOR field
# print this new line

#sed -e "/Minor/ s/^/ $MAGENTA_FONT $YELLOW_BACKGROUND/" -e "/Minor/ s/$/ $RESET_ALL/" $RAW

awk -v RAW=$RAW '
    BEGIN{
        FS = ","
    }
    {
        if (NR > 1){
            FONT_COLOR[$1] = $3
            BG_COLOR[$1]   = $4
            field = $1
            sed -e "/Minor/ s/^/ $($3_FONT) $($4_BACKGROUND)/" -e "/$1/ s/$/ $($RESET_ALL)/" $($RAW)
        }
    }
' $2