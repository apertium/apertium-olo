#!/bin/bash

LEGPARSER=$HOME/github/flammie/leg-ape-ud/legproc.py
GTDESC=$HOME/gtsvn/langs/olo/src/analyser-gt-desc.hfstol
file_id_diz=$(basename $@ | sed -e 's/.text//')
cat $@ | egrep -v '^#!' | hfst-proc $GTDESC > $file_id_diz
python $LEGPARSER --giella --not-rules apertium-olo.olo.leg -i $file_id_diz
