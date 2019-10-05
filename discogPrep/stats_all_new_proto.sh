#!/bin/sh

# NOTE: Not all the Regions here are identical types. They are here to server as example types of different data groupings that can be done covering : Geographical, Psychological, Social-Economic, Economic, Governmental, Ecomincal, Social dimensions. 

# GET World musics entry count by country:  $ cat FLAT_LATERDB | awk '{FS="::"} {print $4 $5}' | grep 'World*' | sort -rn | uniq -c | sort -rn


ret=`cat ALL_FLATDB | wc -l`
echo 'TOTAL: ' ${ret};

printf "\n"

pret=`cat ALL_FLATDB | grep '::Pop' | wc -l`
popr=$(awk "BEGIN {print ($pret / $ret) * 100}")
echo 'Pop: ' ${pret} ' % [' ${popr} ']';

rret=`cat ALL_FLATDB | grep '::Rock' | wc -l`
ropr=$(awk "BEGIN {print ($rret / $ret) * 100}")
echo 'Rock: ' ${rret} ' % [' ${ropr} ']';

eret=`cat ALL_FLATDB | grep '::Electronic' | wc -l`
elpr=$(awk "BEGIN {print ($eret / $ret) * 100}")
echo 'Electronic: ' ${eret} ' % [' ${elpr} ']';

hret=`cat ALL_FLATDB | grep '::Hip Hop' | wc -l`
hhpr=$(awk "BEGIN {print ($hret / $ret) * 100}")
echo 'Hip-Hop: ' ${hret} ' % [' ${hhpr} ']';

printf "\n"


# CASE (flag for VIEW type)

# Parse Through Storage Type (Flat File - Non CSV-type; DB), for building VIEW

# Later: for i in `cat ALL_FLATDB`;
# for i in `cat COUNTRY_GROUPINGS`
# for x in `cat COUNTRY_GROUPINGS `; do echo ${x} | grep "^[A-Z+][A-Z+]" | awk '{FS=":"} {print $1}'; done;

for i in `cat COUNTRY_GROUPINGS `;
do 
   x=`echo ${i} | sed "s/\n*//g" | grep "^[A-Z+][A-Z+]" | awk '{FS=":"} {print $1}'`
   echo ${x}
done 
