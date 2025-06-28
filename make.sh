#!/bin/bash
#shabang !!
set -euo pipefail
shopt -s nullglob

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
for f in *.o;do 
    rm "$f"
done
echo "Deleted dot files ."
echo "Compilation successful."

if [ -s error.log ]; then
    batcat error.log
else
    echo "NO POTENTIAL ERRORS FOUND "
fi
