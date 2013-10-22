#!/bin/bash
#
# Copyright (C) 2013 Xavier Bruhiere

# This script search for the given pattern in files recursively from the given path

#TODO Wrap it to build an automatic ticket tracking system integratted with simple deffect

set -u
clear

if [ $# -lt 1 ]; then
    echo "Usage: ./task-check 'pattern to match' 'start directory'"
    PATTERN="TODO"
elif [ $# == 2 ]; then
    PATTERN=$1
elif [ $# == 2 ]; then
    echo "Location provided, going there..."
    cd $2
fi

echo -e " [ $(basename $PWD) - $PATTERN list ]"

count=0
for file in $(find . -type f | egrep -v "res|git|doc|README|check"); do 
    TODOS=$(cat $file | grep -i "$PATTERN")
    if [ ! -z "${TODOS}" ]; then
        count=$((count + 1))
        echo
        echo -e "\n_________________________________________________________________    $file"
        echo "$TODOS" | sed -e 's/^ *//g' -e 's/ *$//g' | sed -e 's/#/ - /g'
    fi
done

zenity --info --text "$PATTERN list: $count tasks, have fun !"
echo -e "\n\t=> $PATTERN list: $count tasks, have fun !"
