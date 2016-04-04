#!/bin/sh
set -e
python glove2js.py -i ../data/en/glove.6B.25k.50d.txt > ../public/MacaronicParseUI/js/glove.js
