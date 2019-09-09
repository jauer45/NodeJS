#!/bin/sh

APAC=('Japan' 'China' 'Taiwan' 'South_Korea' 'North_Korea');

for i in ${APAC[@]};
do
  x=`echo ${i} | sed "s/_/ /g"`
  printf "Breakdown of Genre submition weight for ${x} :\n"
  echo 'Frequency of Style / Genre Music Types: '; grep "::${x}::" ALL_FLATDB | awk '{FS="::"} { print $6 " " $7 }' | sort -rn | uniq -c | sort -rn
  printf "\n"
  printf "\n\n" 
  printf "Catalogged Electronic Music Releases For Asia (Total Per Country) ${x} ";  grep "::${x}::" ALL_FLATDB | grep '::Electronic' | wc -l
   printf "\t Year Of Greatest Catalogged Release 2010s"; grep "::${x}::" ALL_FLATDB | grep '::Electronic' | awk '{FS="::"} {print $2}' | grep "^201[0-9\-]*" | sed -e "s/\:\:[A-Za-z0-9*]*//g" | sort -rn | uniq -c | sort -rn | head -1
  printf "\n" 
  printf "\t Year Of Greatest Catalogged Release 2000s"; grep "::${x}::" ALL_FLATDB | grep '::Electronic' | awk '{FS="::"} {print $2}' |  grep "^200[0-9]" | sed -e "s/\:\:[A-Za-z0-9*]*//g" | sort -rn | uniq -c | sort -rn | head -1
  printf "\n"
  printf "\t Year Of Greatest Catalogged Release 1990s"; grep "::${x}::" ALL_FLATDB | grep '::Electronic' | awk '{FS="::"} {print $2}' |  grep "^199[0-9]" | sed -e "s/\:\:[A-Za-z0-9*]*//g" | sort -rn | uniq -c | sort -rn | head -1
  printf "\n"
   printf "\t Year Of Greatest Catalogged Release 1980s"; grep "::${x}::" ALL_FLATDB | grep '::Electronic' | awk '{FS="::"} {print $2}' |  grep "^198[0-9]" | sed -e "s/\:\:[A-Za-z0-9*]*//g" | sort -rn | uniq -c | sort -rn | head -1
  printf "\n\n"
   printf "\t Year Of Greatest Catalogged Release 1970s"; grep "::${x}::" ALL_FLATDB | grep '::Electronic' | awk '{FS="::"} {print $2}' |  grep "^197[0-9]" | sed -e "s/\:\:[A-Za-z0-9*]*//g" | sort -rn | uniq -c | sort -rn | head -1
  printf "\n\n"

done



