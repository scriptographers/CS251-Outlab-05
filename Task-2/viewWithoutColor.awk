#!/bin/awk -f

BEGIN {
    FS = ","
    RS = "\r\n"
}
{
    # Formatting the header
    if (NR == 1){

        # First set of hyphens (NF-1) since we print 1 field less
        for (i=0; i<20*(NF-1); i++)
            printf "-"
        printf "\n"

        # The header, all except 4
        for (i=1; i<=NF; i++){
            if (i != 4)
            printf("%20s", $i)
        }
        printf "\n"

        # Second set of hyphens
        for (i=0; i<20*(NF-1); i++)
            printf "-"
        printf "\n"

    }
    else{
        # Print the data
        for (i=1; i<=NF; i++){
            if (i != 4)
                printf("%20s", $i)
        }
        printf "\n"
    }
}
END{}