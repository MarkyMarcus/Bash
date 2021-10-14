#!/usr/bin/env bash

#
# Get a random name from a file
#

# List of names
LIST=/usr/share/dict/propernames

# Get the count from the file
COUNT=`cat $LIST | wc -l | tr -d \ `

# Randomly pick a line in the file 
PICK=$(((($RANDOM % $COUNT))+1))

# Execution
head -$PICK $LIST | tail -1
