#!/bin/bash
#shabang !!
set -euo pipefail
shopt -s nullglob

function delete_o(){
    for f in *.o;do 
        rm "$f"
    done
}
# Clear previous error log
> error.log

echo "Starting compilation..."

for f in *.c; do
    echo "Compiling $f"
    # Compile and redirect stderr to error.log, append mode
    if ! gcc -c "$f" 2>>error.log; then
        echo "Error compiling $f. See error.log for details."
        continue
    fi
done
if [ -s error.log ]; then
    delete_o
    echo "Deleted dot files ."
    batcat error.log
else
    gcc *.o -o p
    echo "NO POTENTIAL ERRORS FOUND "
    echo "Compilation successful."
    ./p
    delete_o
fi

