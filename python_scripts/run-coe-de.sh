#!/bin/sh
set -e
FOLDER="../data/de/nachrichtenleicht-batch2"

./un-preorder.py -o $FOLDER/nachrichtenleicht.de.tok -i $FOLDER/nachrichtenleicht.de.unsplit -a $FOLDER/nachrichtenleicht.de.wa > $FOLDER/nachrichtenleicht.de.alignment
./untangle-wa.py -i $FOLDER/nachrichtenleicht.de.unsplit -o $FOLDER/nachrichtenleicht.de.wa > $FOLDER/nachrichtenleicht.de.wa.untangled
./true-align.py -w $FOLDER/nachrichtenleicht.de.wa.untangled -a $FOLDER/nachrichtenleicht.de.alignment > $FOLDER/nachrichtenleicht.de.wa.untangled.true.aligned
./coe-from-mt.py -i $FOLDER/nachrichtenleicht.de.tok -o $FOLDER/nachrichtenleicht.de.wa.untangled.true.aligned -e $FOLDER/nachrichtenleicht.de.tok.edges.uniq.intermediate -p $FOLDER/nachrichtenleicht.de.tok.dep.parsed   --out  $FOLDER/nachrichtenleicht.de
echo "nachrichtenleicht.de.js saved in '$FOLDER'"
echo "nachrichtenleicht.de.preview.js saved in '$FOLDER'"

