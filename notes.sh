#!/bin/bash

set -e

opts="Write New_Note Read New_Note_In_Directory "
query=$(printf "%s\n" $opts | fzf --border=sharp --prompt="Search > " --margin=1,2 --padding=1)

# echo -e "\n🔍 Press [Enter] to preview, or type '-w' to edit:"
# echo -e "\n or type '-n' to create a new file and hop in :\n"
# read -p "query: " query


# read the query
if [ "$query" = "Write" ]; then
    selected=$(find ~/notes -type f | fzf --prompt="📁 Pick a note: ")
    vim "$selected"

elif [ "$query" = "New_Note" ]; then
    read -p "new file name: " filename
    touch ~/notes/"$filename"
    vim "$filename"

elif [ "$query" = "New_Note_In_Directory" ]; then
    read -p "new file name: " filename
    touch "$filename"
    vim "$filename"

elif [ "$query" = "Read" ]; then
    selected=$(find ~/notes -type f | fzf --prompt="📁 Pick a note: ")
    batcat "$selected"
else
    echo "   ...🔍Wrong arguments...   "
fi
