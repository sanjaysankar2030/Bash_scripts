#!/bin/bash

set -e

selected=$(find /mnt/d/Books -type f | fzf --prompt="📁 Pick a book: ")
win_path=$(wslpath -w "$selected")
cmd.exe /c start "" "$win_path"



