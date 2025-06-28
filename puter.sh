#!/bin/bash

# Optional: use provided directory or default to current dir
DIR="${1:-.}"

# Launch fzf with bat preview and open selected file in vim
SELECTED=$(find "$DIR" -type f 2>/dev/null | fzf --preview 'batcat --style=numbers --color=always --line-range :500 {}')

# Check if a file was selected
if [[ -n "$SELECTED" ]]; then
    vim "$SELECTED"
fi

