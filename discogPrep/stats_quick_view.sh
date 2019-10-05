grep "Total \/ \% \[of World output\] : " STATS_ALL_TMPFLAT | sed -e "s/ \:  0  \% \[ 0 \]//g" | grep ":" > discogs_countries_with_entries
sleep 1
grep "\% \[of World output\] :  0  \% \[ 0 \]" STATS_ALL_TMPFLAT > discogs_countries_with_little-or-no_entries
