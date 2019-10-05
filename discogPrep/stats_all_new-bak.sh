#!/bin/sh

# NOTE: Not all the Regions here are identical types. They are here to server as example types of different data groupings that can be done covering : Geographical, Psychological, Social-Economic, Economic, Governmental, Ecomincal, Social dimensions. 

# GET World musics entry count by country:  $ cat FLAT_LATERDB | awk '{FS="::"} {print $4 $5}' | grep 'World*' | sort -rn | uniq -c | sort -rn

# Used for feeding release ids to be read in node.js discogs API 
#  for x in `ls ARTIST/`; do cat 'ARTIST/'${x}; done;
#

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
printf "REGION: APAC \n"


for i in `node json_parse_APAC.js | sed -e "s/ /\_/g"` ; do  x=`echo ${i} | sed "s/_/ /g"`; printf "${x} "; grep "::${x}::" ALL_FLATDB | wc -l ; printf "Breakdown of Genre submition weight for ${x} :\n" ;  printf " Pop: "; grep "::${x}::Pop" ALL_FLATDB | wc -l ; printf " Rock: "; grep "::${x}::Rock" ALL_FLATDB | wc -l ; printf " Electronic: "; grep "::${x}::Electronic" ALL_FLATDB | wc -l ; printf " Funk / Soul: "; grep "::${x}::Funk" ALL_FLATDB | wc -l ; printf " Folk, World & Country: "; grep "::${x}::Folk" ALL_FLATDB | wc -l ; printf " Stage & Screen: "; grep "::${x}::Stage" ALL_FLATDB | wc -l ; printf "\n\n"; done;

printf "\n"
printf "REGION: LOST ASIA (Former State/Republics) \n"


printf "\n"
printf "REGION: AFRICA \n"

for i in `node json_parse_AFCA.js | sed -e "s/ /\_/g"` ; do  x=`echo ${i} | sed "s/_/ /g"`; printf "${x} "; grep "::${x}::" ALL_FLATDB | wc -l ; printf "Breakdown of Genre submition weight for ${x} :\n" ;  printf " Pop: "; grep "::${x}::Pop" ALL_FLATDB | wc -l ; printf " Rock: "; grep "::${x}::Rock" ALL_FLATDB | wc -l ; printf " Electronic: "; grep "::${x}::Electronic" ALL_FLATDB | wc -l ; printf " Funk / Soul: "; grep "::${x}::Funk" ALL_FLATDB | wc -l ; printf " Folk, World & Country: "; grep "::${x}::Folk" ALL_FLATDB | wc -l ; printf " Stage & Screen: "; grep "::${x}::Stage" ALL_FLATDB | wc -l ; printf "\n\n"; done;

printf "\n"
printf "REGION: LOST AFRICA \n"


printf "\n"
printf "REGION: EUROPE \n"

for i in `node json_parse_EURO.js | sed -e "s/ /\_/g"` ; do  x=`echo ${i} | sed "s/_/ /g"`; printf "${x} "; grep "::${x}::" ALL_FLATDB | wc -l ; printf "Breakdown of Genre submition weight for ${x} :\n" ;  printf " Pop: "; grep "::${x}::Pop" ALL_FLATDB | wc -l ; printf " Rock: "; grep "::${x}::Rock" ALL_FLATDB | wc -l ; printf " Electronic: "; grep "::${x}::Electronic" ALL_FLATDB | wc -l ; printf " Funk / Soul: "; grep "::${x}::Funk" ALL_FLATDB | wc -l ; printf " Folk, World & Country: "; grep "::${x}::Folk" ALL_FLATDB | wc -l ; printf " Stage & Screen: "; grep "::${x}::Stage" ALL_FLATDB | wc -l ; printf "\n\n"; done;

printf "\n"
printf "REGION: LOST EUROPE and SOVIET BLOC \n"


printf "\n"
printf "REGION: AMERICAS \n"

for i in `node json_parse_AMRCS.js | sed -e "s/ /\_/g"` ; do  x=`echo ${i} | sed "s/_/ /g"`; printf "${x} "; grep "::${x}::" ALL_FLATDB | wc -l ; printf "Breakdown of Genre submition weight for ${x} :\n" ;  printf " Pop: "; grep "::${x}::Pop" ALL_FLATDB | wc -l ; printf " Rock: "; grep "::${x}::Rock" ALL_FLATDB | wc -l ; printf " Electronic: "; grep "::${x}::Electronic" ALL_FLATDB | wc -l ; printf " Funk / Soul: "; grep "::${x}::Funk" ALL_FLATDB | wc -l ; printf " Folk, World & Country: "; grep "::${x}::Folk" ALL_FLATDB | wc -l ; printf " Stage & Screen: "; grep "::${x}::Stage" ALL_FLATDB | wc -l ; printf "\n\n"; done;

printf "\n"
printf "REGION: LOST AMERICAS \n"

