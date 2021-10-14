#!/usr/bin/env bash

#
# Organize a directory of pictures into directories
# defined by the photo's EXIF data
#
# e.g. YYYYMM
#

# Directory of photos to organize
INPUT=/tmp/input

# Output directory
OUTPUT=/tmp/output

# Loop for each file in the input directory
for FILE in $INPUT/*
do
    # Use the exiftool command to get the creation date
    CDATE=`exiftool -CreateDate $FILE | awk '{ print $4 }'`

    # Extract the year
    YEAR=`echo $CDATE | cut -d: -f1`

    # Extract the month
    MONTH=`echo $CDATE | cut -d: -f2`

    # Build the destination folder
    DEST=$OUTPUT/$YEAR$MONTH

    # If it doesn't exist then create it
    if [ ! -d $DEST ]
    then
        # The -p will create any parent directory too
        mkdir -p $DEST
    fi

    # Copy the photo to it's organized folder
    cp $FILE $DEST
done
