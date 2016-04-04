#!/bin/sh
set -e
./un-preorder.py -o ../data/de/nachrichtenleicht-filtered/nachrichtenleicht.de.tok -i ../data/de/nachrichtenleicht-filtered/nachrichtenleicht.de.unsplit -a ../data/de/nachrichtenleicht-filtered/nachrichtenleicht.de.wa > ../data/de/nachrichtenleicht-filtered/nachrichtenleicht.de.alignment
./untangle-wa.py -i ../data/de/nachrichtenleicht-filtered/nachrichtenleicht.de.unsplit -o ../data/de/nachrichtenleicht-filtered/nachrichtenleicht.de.wa > ../data/de/nachrichtenleicht-filtered/nachrichtenleicht.de.wa.untangled
./true-align.py -w ../data/de/nachrichtenleicht-filtered/nachrichtenleicht.de.wa.untangled -a ../data/de/nachrichtenleicht-filtered/nachrichtenleicht.de.alignment > ../data/de/nachrichtenleicht-filtered/nachrichtenleicht.de.wa.untangled.true.aligned
./coe-from-mt.py -i ../data/de/nachrichtenleicht-filtered/nachrichtenleicht.de.tok -o ../data/de/nachrichtenleicht-filtered/nachrichtenleicht.de.wa.untangled.true.aligned  -p ../data/de/nachrichtenleicht-filtered/nachrichtenleicht.de.tok.dep.parsed  -s Artikel --out  ../data/de/nachrichtenleicht-filtered/nachrichtenleicht.de
#cp ../data/de/nachrichtenleicht-filtered/nachrichtenleicht.de.js ../stories/nachrichtenleicht.de.js
#cp ../data/de/nachrichtenleicht-filtered/nachrichtenleicht.de.preview.js ../stories/nachrichtenleicht.de.preview.js
echo "nachrichtenleicht.de.js saved in '../data/de/nachrichtenleicht-filtered/'"
echo "nachrichtenleicht.de.preview.js saved in '../data/de/nachrichtenleicht-filtered/'"
