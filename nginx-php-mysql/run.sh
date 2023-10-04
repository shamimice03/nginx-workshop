#!/bin/bash

# Find all script files in the current directory
SCRIPT_FILES=(*_*.sh)

# Sort the script files by their numerical prefixes
IFS=$'\n' sorted=($(sort <<<"${SCRIPT_FILES[*]}"))
unset IFS

# Loop through and execute the sorted scripts
for SCRIPT in "${sorted[@]}"; do
    if [ -x "$SCRIPT" ]; then
        echo "=============================Running $SCRIPT============================================="
        "./$SCRIPT"
    else
        echo "Error: $SCRIPT is not executable or does not exist."
        exit 1
    fi
done

echo "All scripts have been executed."
