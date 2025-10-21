#!/bin/bash

set -e
selected=$(find ~/notes -type f | fzf --prompt="📁 Pick a note: ")

if [ "$selected" == "new" ];then
    opts=" New_Note  New_Note_In_Directory "
    query=$(printf "%s\n" $opts | fzf --border=sharp --prompt="Search > " --margin=1,2 --padding=1)
    if [ "$query" = "New_Note" ]; then
        read -p "Enter new note name: " filename
        filepath=~/notes/"$filename".md
        touch ~/notes/"$filepath"
        vim "$filepath"
    elif [ "$query" = "New_Note_In_Directory" ]; then
        read -p "Enter new note name: " filename
        filepath="$filename".md
        touch "$filepath"
        vim "$filepath"
    else
        return 0 
    fi
fi


opts="Write Read  "
query=$(printf "%s\n" $opts | fzf --border=sharp --prompt="Search > " --margin=1,2 --padding=1)
if [ "$query" = "Write" ]; then
    vim "$selected"
elif [ "$query" = "Read" ]; then
    batcat "$selected"
else
    echo "   ...🔍Wrong arguments...   "
fi
