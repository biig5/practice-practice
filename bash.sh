#!/bin/bash
NUM=$1

if [ -z "${NUM}" ]; then
    echo "Error: No value provided"
    echo "Usage: $0 <num>"
    exit 1
fi

if [ "${NUM}" -ge 70 ]; then
    echo "Grade: A1"
elif [ "${NUM}" -ge 60 ]; then
    echo "Grade: B2"
elif [ "${NUM}" -ge 50 ]; then
    echo "Grade: C4"
else
    echo "Grade: F9"
fi

