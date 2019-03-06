#!/bin/bash

if test $# -lt 1 ; then
    echo Usage: $0 giella-olo-dir
    exit 2
fi

cat $1/src/morphology/root.lexc \
    $1/src/morphology/stems/*.lexc \
    $1/src/morphology/affixes/*.lexc \
    $1/src/morphology/compounding.lexc \
    $1/src/morphology/generated_files/*.lexc |\
    sed -f dev/giella2apes.sed > apertium-olo.olo.lexc
cp $1/src/phonology/olo-phon.twolc apertium-olo.olo.morf.twol

