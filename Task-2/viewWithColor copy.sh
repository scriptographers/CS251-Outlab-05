#!/bin/bash

source ./resources/defineColors.sh # Loading in the bash color variables

RAW=$1
GUIDE=$2

# awk '
# BEGIN {
#     FS = "."
#     RS = "\r\n"
# }
# {
#     # File 1
#     if (FNR == NR) {
#         if (FNR > 1) {
#             font[$1] = $3+"_FONT"
#             bg[$1] = $4+"_BACKGROUND"
#         }
#     }
#     # File 2
#     else {
#         if (FNR > 1) {
#             # print $7, grade[$7]
#             points += $5 * grade[$7]
#             credits += $5
#         }
#     }
# }
# ' $GUIDE $RAW

awk -v RAW=$RAW '
BEGIN {
    FS = ","
    RS = "\r\n"
    printf("sed -n -r ")
}
{
    if (NR > 1) {
        font = $3"_FONT"
        bg = $4"_BACKGROUND"
        # print font, bg
        # print $1
        printf("-e \"/"$1"/ s/^/\"${"bg"}${"font"}\"/\" ")
    }
}
END {
    printf("-e \"4,$ s/$/\"${RESET_ALL}\"/ p\" -e \"1,3 p\" "RAW)
}
' $GUIDE > y
bash y
rm -rf y

# # Search "Tag" in RAW
# # Search GUIDE for the respective Tag / Use an associative array to store the data
# # FONT_COLOR[tag] = ...
# # Replace the field by $COLOR $BG_COLOR field
# # print this new line

# #sed -e "/Minor/ s/^/ $MAGENTA_FONT $YELLOW_BACKGROUND/" -e "/Minor/ s/$/ $RESET_ALL/" $RAW

# awk -v RAW=$RAW '
#     BEGIN{
#         FS = ","
#     }
#     {
#         if (NR > 1){
#             FONT_COLOR[$1] = $3
#             BG_COLOR[$1]   = $4
#             field = $1
#             system("sed -e '"'"'/Minor/ s/^/ '$($3_FONT)' '$($4_BACKGROUND)'/'"'"' -e '"'"'/$1/ s/$/ $($RESET_ALL)/'"'"' $($RAW))
#         }
#     }
# ' $2
