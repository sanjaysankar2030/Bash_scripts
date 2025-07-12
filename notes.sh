#!/bin/bash

set -e

echo -e "\n🔍 Press [Enter] to preview, or type '-w' to edit:"
echo -e "\n or type '-n' to create a new file and hop in :\n"
read -p "query: " query


# read the query
if [ "$query" = "-w" ]; then
    selected=$(find ~/notes -type f | fzf --prompt="📁 Pick a note: ")
    vim "$selected"

elif [ "$query" = "-n" ]; then
    read -p "new file name: " filename
    touch "$filename"
    vim "$filename"
else
    selected=$(find ~/notes -type f | fzf --prompt="📁 Pick a note: ")
    batcat "$selected"
fi
