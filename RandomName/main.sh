#!/usr/bin/env bash

#
# Get a random name from a file
#

# List of names
LIST=/usr/share/dict/propernames

# Get the count from the file
COUNT=`cat $LIST | wc -l | tr -d \ `

# randomly pick a line in the file 
PICK=$(((($RANDOM % $COUNT))+1))

#execution

head -$PICK $LIST | tail -1
