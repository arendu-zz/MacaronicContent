#!/bin/sh
set -e
FOLDER="../data/de/nachrichtenleicht-podcast"
for CAT in 'news' 'culture' 'sport'
do
    FILE="nach-podcast-$CAT.de"
    SPLIT_FILES_LOCATION="../data/de/tt/"
    ./insert_truecased.py -t  $FOLDER/$FILE.truecased -w $FOLDER/$FILE.wa.untangled.true.aligned.post >  $FOLDER/$FILE.wa.untangled.true.aligned.post.truecased
    ./coe-from-mt.py -i $FOLDER/$FILE.tok -o $FOLDER/$FILE.wa.untangled.true.aligned.post.truecased -e $FOLDER/$FILE.tok.edges.uniq.intermediate -p $FOLDER/$FILE.tok.dep.parsed   --out  $FOLDER/$FILE
    ./split_final_json.py -j  $FOLDER/$FILE.json -t  $FOLDER/$FILE.tok -o $SPLIT_FILES_LOCATION -c $CAT
    echo "$FILE.json saved in '$FOLDER'"
    echo "split files saved in " $SPLIT_FILES_LOCATION
done

