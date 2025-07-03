#!/bin/bash

set -e

lang="python c cpp rust golang lua nodejs"
selected=$(printf "%s\n" $lang | fzf)

read -p "query: " query

mkdir -p temp
tempfile="temp/${query// /_}.$selected"  # Replace spaces with _ for filename safety

# Fetch from cht.sh and save directly
curl -s "cht.sh/$selected/$(echo "$query" | tr ' ' '+')"  | sed -r 's/\x1B\[[0-9;]*m//g'  > $tempfile
# Open in Vim without binary issues

vim "$tempfile"

# Cleanup
