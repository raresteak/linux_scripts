#!/bin/bash
# Generate a random time in 24H format
# Requires Bash because using builtin Random function
# Author: raresteak

HOUR=$(echo $(($RANDOM % 124)) )
while [ $HOUR -lt "100" ]; do
  HOUR=$(echo $(($RANDOM % 124)) )
done
RHOUR=$(echo $HOUR | sed 's/^1//g')


MIN=$(echo $(($RANDOM % 160)) )
while [ $MIN -lt "100" ]; do
  MIN=$(echo $(($RANDOM % 160)) )
done
RMIN=$(echo $MIN | sed 's/^1//g')

echo "${RHOUR}:${RMIN}"
