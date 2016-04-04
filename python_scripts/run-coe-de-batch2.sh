#!/bin/sh
set -e
./un-preorder.py -o ../data/de/nachrichtenleicht-batch2/nachrichtenleicht.de.tok -i ../data/de/nachrichtenleicht-batch2/nachrichtenleicht.de.unsplit -a ../data/de/nachrichtenleicht-batch2/nachrichtenleicht.de.wa > ../data/de/nachrichtenleicht-batch2/nachrichtenleicht.de.alignment
./untangle-wa.py -i ../data/de/nachrichtenleicht-batch2/nachrichtenleicht.de.unsplit -o ../data/de/nachrichtenleicht-batch2/nachrichtenleicht.de.wa > ../data/de/nachrichtenleicht-batch2/nachrichtenleicht.de.wa.untangled
./true-align.py -w ../data/de/nachrichtenleicht-batch2/nachrichtenleicht.de.wa.untangled -a ../data/de/nachrichtenleicht-batch2/nachrichtenleicht.de.alignment > ../data/de/nachrichtenleicht-batch2/nachrichtenleicht.de.wa.untangled.true.aligned
./coe-from-mt.py -i ../data/de/nachrichtenleicht-batch2/nachrichtenleicht.de.tok -o ../data/de/nachrichtenleicht-batch2/nachrichtenleicht.de.wa.untangled.true.aligned  -p ../data/de/nachrichtenleicht-batch2/nachrichtenleicht.de.tok.dep.parsed  -s Artikel --out  ../data/de/nachrichtenleicht-batch2/nachrichtenleicht.de
cp ../data/de/nachrichtenleicht-batch2/nachrichtenleicht.de.js ../stories/nachrichtenleicht.de.js
cp ../data/de/nachrichtenleicht-batch2/nachrichtenleicht.de.preview.js ../stories/nachrichtenleicht.de.preview.js

