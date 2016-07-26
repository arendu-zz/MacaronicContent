#!/bin/sh
set -e
FOLDER="../data/de/nachrichtenleicht-podcast"
for CAT in 'news' 'culture' 'sport'
do
    FILE="nach-podcast-$CAT.de"
    SPLIT_FILES_LOCATION="../data/de/tt/"
    ./rich2wa.py -r $FOLDER/$FILE.output > $FOLDER/$FILE.wa
    ./make_unsplit.py -s $FOLDER/$FILE > $FOLDER/$FILE.unsplit
    ./un-preorder.py -o $FOLDER/$FILE.tok -i $FOLDER/$FILE.unsplit -a $FOLDER/$FILE.wa > $FOLDER/$FILE.alignment
    ./untangle-wa.py -i $FOLDER/$FILE.unsplit -o $FOLDER/$FILE.wa > $FOLDER/$FILE.wa.untangled
    ./true-align.py -w $FOLDER/$FILE.wa.untangled -a $FOLDER/$FILE.alignment > $FOLDER/$FILE.wa.untangled.true.aligned
    ./coe-from-mt.py -i $FOLDER/$FILE.tok -o $FOLDER/$FILE.wa.untangled.true.aligned -e $FOLDER/$FILE.tok.edges.uniq.intermediate -p $FOLDER/$FILE.tok.dep.parsed   --out  $FOLDER/$FILE
    echo "$FILE.json saved in '$FOLDER'"
    echo "split files saved in " $SPLIT_FILES_LOCATION
done

