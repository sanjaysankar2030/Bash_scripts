#!/bin/bash
#shabang !!
if [ "$1" = "-w" ]; then
    vim ~/notes.md
else
    batcat ~/notes.md
fi
    

