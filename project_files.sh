#!/bin/bash
#shabang !!
tabs="$HOME/navs/projects.txt"
selected=$(cut -d: -f1 "$tabs" | fzf --border=sharp --prompt="Search > " --margin=1,2 --padding=1)
target=$(grep "^$selected:" ~/navs/projects.txt | cut -d: -f2-)
target=$(echo "$target"|tr -d ' ')
eval target="$target"
eval "cd "$target""
tmux new-session -c ~/"$target"-d
tmux attach
break
