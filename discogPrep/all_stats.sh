#!/bin/sh

echo 'Date Time Stamp: '`date`
printf "\n"

./flatdb_repl.sh

./stats_all.sh
./statsII.sh
./electronic_asia.sh
./electronic_seasia.sh
./electronic_casia.sh
./electronic_subasia.sh
./electronic_oceana.sh

