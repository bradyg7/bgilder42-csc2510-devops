#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: $0 <csvfile>"
    exit 1
fi

CSV_FILE="$1"

if [ ! -f "$CSV_FILE" ]; then
    echo "Error: File '$CSV_FILE' not found."
    exit 1
fi

TOTAL=0
LINE_NUM=0

echo "-----------------------------------"
echo " numberX   numberY   Sum"
echo "-----------------------------------"

while IFS=',' read -r numX numY; do
   
    numX=$(echo "$numX" | tr -d ' ')
    numY=$(echo "$numY" | tr -d ' ')

    if [ -z "$numX" ] || [ -z "$numY" ]; then
        continue
    fi

    LINE_NUM=$((LINE_NUM + 1))
    LINE_SUM=$((numX + numY))
    TOTAL=$((TOTAL + LINE_SUM))

    printf " %-9s %-9s %s\n" "$numX" "$numY" "$LINE_SUM"

done < "$CSV_FILE"

echo "-----------------------------------"
echo " Lines processed : $LINE_NUM"
echo " Grand total sum : $TOTAL"
echo "-----------------------------------"
