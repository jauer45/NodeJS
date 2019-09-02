#!/bin/sh

echo 'Date Time Stamp: '`date`
if [ -f STATS_ALL ]; then
	rm STATS_ALL
fi

printf "\n"

./flatdb_repl_new.sh
./stats_all_new.sh >> STATS_ALL

