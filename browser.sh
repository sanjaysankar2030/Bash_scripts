#!/bin/bash
#shabang !!

set -e

tab="NeetCode Notes CodeSignal Calander  Perplexity Grok  Projects Youtube Whatsapp Thirukkural Coursera ChatGpt Books Paint Twitch  New_Tab Github Create_Repo"
while true; do
selected=$(printf "%s\n" $tab | fzf --border=sharp --prompt="Search > " --margin=1,2 --padding=1)
if [[ "$selected" == "Quit" || "$selected" == "q" || "$selected" == "Q" ]]; then
    break
# THIS IS FOR NOTES
elif [ "$selected" = "Notes" ]; then
    bash ~/bash_scripts/notes.sh

elif [ "$selected" = "Projects" ]; then
    eval "source ~/bash_scripts/project_files.sh"
    break
    
elif [ "$selected" = "Thirukkural" ]; then
    "/mnt/c/Program Files/Firefox Developer Edition/firefox.exe" "thirukkural.io" &>/dev/null & 

elif [ "$selected" = "Calander" ]; then
    "/mnt/c/Program Files/Firefox Developer Edition/firefox.exe" "https://calendar.google.com/calendar/u/0/r" &>/dev/null & 

elif [ "$selected" = "ChatGpt" ]; then
    "/mnt/c/Program Files/Firefox Developer Edition/firefox.exe" "chat.openai.com" &>/dev/null & 

elif [ "$selected" = "Grok" ]; then
    "/mnt/c/Program Files/Firefox Developer Edition/firefox.exe" "grok.com" &>/dev/null & 

elif [ "$selected" = "Perplexity" ]; then
    "/mnt/c/Program Files/Firefox Developer Edition/firefox.exe" "perplexity.ai" &>/dev/null & 
elif [ "$selected" = "Coursera" ]; then
    "/mnt/c/Program Files/Firefox Developer Edition/firefox.exe" "coursera.org/my-learning" &>/dev/null & 

elif [ "$selected" = "NeetCode" ]; then
    "/mnt/c/Program Files/Firefox Developer Edition/firefox.exe" "neetcode.io/practice" &>/dev/null & 

elif [ "$selected" = "CodeSignal" ]; then
    "/mnt/c/Program Files/Firefox Developer Edition/firefox.exe" "codesignal.com/learn" &>/dev/null & 
elif [ "$selected" = "Books" ]; then
    # "/mnt/c/Program Files/Firefox Developer Edition/firefox.exe" "/mnt/d/crafting-interpreters.pdf" &>/dev/null &
    # cmd.exe /c start "" "D:\\crafting-interpreters.pdf"
    bash ~/bash_scripts/book.sh

elif [ "$selected" = "Youtube" ]; then
    "/mnt/c/Program Files/Firefox Developer Edition/firefox.exe" "youtube.com" &>/dev/null &
    break

elif [ "$selected" = "Whatsapp" ]; then
    "/mnt/c/Program Files/Firefox Developer Edition/firefox.exe" "web.whatsapp.com" &>/dev/null &

elif [ "$selected" = "Paint" ]; then
    mspaint.exe "$(wslpath -w /mnt/d/blank.png)"&>/dev/null &

elif [ "$selected" = "Twitch" ]; then
    "/mnt/c/Program Files/Firefox Developer Edition/firefox.exe" "twitch.tv" &>/dev/null &

elif [ "$selected" = "Github" ]; then
    "/mnt/c/Program Files/Firefox Developer Edition/firefox.exe" "https://github.com/sanjaysankar2030?tab=repositories" &>/dev/null &
    
elif [ "$selected" = "Create_Repo" ]; then
    "/mnt/c/Program Files/Firefox Developer Edition/firefox.exe" "github.com/new" &>/dev/null &
    
elif [ "$selected" = "New_Tab" ]; then
    query=$(fzf --print-query --prompt="Search Google > " --layout=reverse --border=rounded <<< "" | head -n1)
    [ -z "$query" ]  && exit 1
    fin_query=$(echo "$query" | tr ' ' '+')
    "/mnt/c/Program Files/Firefox Developer Edition/firefox.exe" "https://www.google.com/search?q=$fin_query" &>/dev/null &

else
    echo "Wrong argument provided"
fi
done
