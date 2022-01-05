#!/bin/bash
# Helper script for a helper script. Shoves files into program. See program comments for output.

FILES="*.txt"
PANTHEON_CT=1
DEITY_CT=1

for f in $FILES
do
    python3 ./deity-table-parser.py $f $PANTHEON_CT $DEITY_CT
    dwc=$(wc -l < "$f")
    dc=$( expr "$dwc" / 4 )
    ((PANTHEON_CT++))
    ((DEITY_CT+="$dc"))
done
