#!/bin/sh
set -e
INP=$1
OUT=$2
python make_training_examples.py > $INP 2> $INP.warings
python get_training_vocab.py -t $INP -o $OUT
