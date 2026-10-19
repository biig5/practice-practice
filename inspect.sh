#!/bin/bash

FILE=$1
if [ -z "${FILE}" ]; then
    echo "Error: No Argument Provided" >&2
    echo "Usage: $0 <directory>" >&2
    exit 1
fi

if [ -d "${FILE}" ]; then
    echo "${FILE} is a directory"
else
    echo "Error: This is not a directory" >&2
    echo "Usage: $0 <directory>" >&2
    exit 1
fi

files=0
dirs=0
for item in "$FILE"/*; do
    if [ -f "${item}" ]; then
        files=$((files + 1))
        echo "${item} is a file"
    elif [ -d "${item}" ]; then
        dirs=$((dirs + 1))
        echo "${item} is a directory"
    fi
done
echo "Files: ${files}, Directories: ${dirs}"

