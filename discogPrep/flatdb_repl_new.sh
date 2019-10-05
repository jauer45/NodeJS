#!/bin/sh

if [ -f FLAT_REDO ]; then
  if [ -f FLAT_ADDSIDDB ]; then
    if [ -f TMP_FLAT ]; then
        cat FLAT_REDO | grep "::" >> FLAT_REDO_F; sleep 1; mv FLAT_REDO_F FLAT_REDO
        cat FLAT_ADDSIDDB | grep "::" >> FLAT_ADDSIDDB_F; sleep 1; mv FLAT_ADDSIDDB_F FLAT_ADDSIDDB
        rm TMP_FLAT; cp -p FLAT_REDO TMP_FLAT; cat FLAT_ADDSIDDB >> TMP_FLAT
    fi
  fi
fi


if [ -f ALL_FLATDB ]; then
        rm ALL_FLATDB
fi

cat FLATDB > ALL_FLATDB
cat FLAT_LATERDB >> ALL_FLATDB	# Old style discogs data collection
cat FLAT_ADDSIDDB >> ALL_FLATDB # new style (with id and styles), discogs data collection
