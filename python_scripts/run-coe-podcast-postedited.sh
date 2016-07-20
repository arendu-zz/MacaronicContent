#!/bin/sh
set -e
FOLDER="../data/de/nachrichtenleicht-podcast"
FILE="nach-podcast-news.de"
SPLIT_FILES_LOCATION="../data/de/tt/"
./coe-from-mt.py -i $FOLDER/$FILE.tok -o $FOLDER/$FILE.wa.untangled.true.aligned.post -e $FOLDER/$FILE.tok.edges.uniq.intermediate -p $FOLDER/$FILE.tok.dep.parsed   --out  $FOLDER/$FILE
./split_final_json.py -j  $FOLDER/$FILE.json -t  $FOLDER/$FILE.tok -o $SPLIT_FILES_LOCATION 
echo "$FILE.json saved in '$FOLDER'"
echo "split files saved in " $SPLIT_FILES_LOCATION

