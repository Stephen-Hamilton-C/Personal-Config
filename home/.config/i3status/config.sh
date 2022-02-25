#!/bin/bash

i3status | while :
do
    read line

#    KB_LAYOUT=$(setxkbmap -query | awk '/layout/{print $2}')
#    if [ $KB_LAYOUT == "dvorak" ]
#    then
#        dat="[{ \"full_text\": \"$KB_LAYOUT\", \"color\":\"#009E00\" },"
#    else
#        dat="[{ \"full_text\": \"$KB_LAYOUT\", \"color\":\"#C60101\" },"
#    fi

    TIMECARD=$(~/.local/bin/timecard i3status)
    dat="[{ \"full_text\": \"$TIMECARD\" },"

    echo "${line/[/$dat}" || exit 1
done
