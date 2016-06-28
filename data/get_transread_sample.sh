#!/bin/sh
set -e
wget http://transread.limsi.fr/Resources/LastMohicans-sample.tgz
dtrx LastMohicans-sample.tgz
trash LastMohicans-sample.tgz
