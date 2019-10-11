#!/bin/bash
# this might seem a bit strange so a short summary:
# * replace weights and non-UD miscs with _
# * remove spaceafter=no from the final token
# * collapse miscs with _ into _ or whatever's left
# * remove some automatically reconstituted SpaceAfter duplicates
# * change apertium's .. full stops to .
if test $# != 1 ; then
    echo Usage: $0 CONLLU
    exit 1
fi
cat $@ | sed -e 's/Weight=[0-9.]*/_/' \
    -e 's/SpaceBefore=No/_/' \
    -e 's/\([[:space:]]\.\.[[:space:]].*\)SpaceAfter=No/\1_/' \
    -e 's/_|_/_/' -e 's/_|_/_/' -e 's/|_|/|/' -e 's/	_|/	/' -e 's/|_$//' \
    -e 's/SpaceAfter=No|SpaceAfter=No/SpaceAfter=No/' \
    -e 's/\([^.]\)\.\.$/\1./' \
    -e 's/\([[:space:]]\)\.\.\([[:space:]]\)/\1.\2/' \
    -e 's/\([[:space:]]\)\.\.\([[:space:]]\)/\1.\2/'

