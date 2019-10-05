#!/bin/sh

h=250000;

if [ -f TMP_SGENRES ]; then
        rm  TMP_SGENRES
fi


cat ALL_FLATDB | awk '{FS="::"} {print $6}' | sort -rn | uniq -c | sort -rn | sed -e "s/ /\_/g" > TMP_GENRES; sleep 1; 

for x in `cat TMP_GENRES | sed -e "s/\_*[0-9*]*\_//" | awk '{FS=" "} {print $1}'`; 
	do echo ${x}; 
	i=`echo ${x} | sed -e "s/\_/ /g"`;

	echo ${i} 
	j=`grep "::${i}::" TMP_FLAT | head -${h} | awk '{FS="::"} {print $6 "::" $7}' | sort -rn | uniq -c | sort -rn | head -30 | sed -e "s/ /\_/g" >> TMP_SGENRES`;

	# echo ${j}
	sleep 1;
done;

sleep 1;

for x in `cat TMP_SGENRES | sed -e "s/\_*[0-9*]*\_//" | awk '{FS=" "} {print $1}'`; 
	do echo ${x}; 
	i=`echo ${x} | sed -e "s/\_/ /g"`; 
	echo ${i} >> discogs_deep_dive; 
	grep "${i}" TMP_FLAT | head -${h} | awk '{FS="::"} {print "\t" $3 " " $5 " " $7}' | sort -rn | uniq -c | sort -rn | head -10 >> discogs_deep_dive; 

	printf "\n" >> discogs_deep_dive;
done;

