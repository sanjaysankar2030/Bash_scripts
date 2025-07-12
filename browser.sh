#!/bin/bash
#shabang !!

set -e

tab="Youtube ChatGpt Crafting_Interprters Help New_Tab"
selected=$(printf "%s\n" $tab | fzf --border=sharp --prompt="Search >" --margin=1,2 --padding=1)

if [ "$selected" = "ChatGpt" ]; then
    "/mnt/c/Program Files/Firefox Developer Edition/firefox.exe" "chat.openai.com" &>/dev/null & 
elif [ "$selected" = "Crafting_Interprters" ]; then
    "/mnt/c/Program Files/Firefox Developer Edition/firefox.exe" "https://craftinginterpreters.com/contents.html" &>/dev/null &
elif [ "$selected" = "Youtube" ]; then
    "/mnt/c/Program Files/Firefox Developer Edition/firefox.exe" "youtube.com" &>/dev/null &
elif [ "$selected" = "Help" ]; then
    echo "-g -> chatgpt"
    echo "-b -> book"
    echo "-y -> youtube"
    echo "no argument  -> new tab"
elif [ "$selected" = "New_Tab" ]; then
    "/mnt/c/Program Files/Firefox Developer Edition/firefox.exe" &>/dev/null & 
else
    echo "Wrong argument provided"
fi
