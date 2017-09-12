#!/bin/sh

if [ -f ALL_FLATDB ]; then
        rm ALL_FLATDB
fi

cat FLATDB > ALL_FLATDB
cat FLAT_LATERDB >> ALL_FLATDB

