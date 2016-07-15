#!/bin/sh
set -e
FOLDER="../data/de/nachrichtenleicht-batch2"
FILE_STEM="nach-podcast-news.de"
./rich2wa.py -f $FOLDER/$FILE.output > $FOLDER/$FILE.wa
./un-preorder.py -o $FOLDER/$FILE.tok -i $FOLDER/$FILE.unsplit -a $FOLDER/$FILE.wa > $FOLDER/$FILE.alignment
./untangle-wa.py -i $FOLDER/$FILE.unsplit -o $FOLDER/$FILE.wa > $FOLDER/$FILE.wa.untangled
./true-align.py -w $FOLDER/$FILE.wa.untangled -a $FOLDER/$FILE.alignment > $FOLDER/$FILE.wa.untangled.true.aligned
./coe-from-mt.py -i $FOLDER/$FILE.tok -o $FOLDER/$FILE.wa.untangled.true.aligned -e $FOLDER/$FILE.tok.edges.uniq.intermediate -p $FOLDER/$FILE.tok.dep.parsed   --out  $FOLDER/$FILE
echo "$FILE.js saved in '$FOLDER'"
echo "$FILE.preview.js saved in '$FOLDER'"
echo "$FILE.json saved in '$FOLDER'"

