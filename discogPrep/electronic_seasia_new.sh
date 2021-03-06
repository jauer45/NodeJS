#!/bin/sh

APAC=('Malaysia' 'Indonesia' 'Philippines' 'Laos' 'Cambodia' 'Vietnam' 'Thailand' 'Myanmar');

for i in ${APAC[@]};
do
  x=`echo ${i} | sed "s/_/ /g"`
  printf "Catalogged Electronic Music Releases For Asia (Total Per Country) ${x} ";  grep "::${x}::" ALL_FLATDB | grep '::Electronic' | wc -l
    printf "\t Year Of Greatest Catalogged Release 2010s"; grep "::${x}::" ALL_FLATDB | grep '::Electronic' | grep "^201[0-9]" |  awk '{FS="::"} {print $1}' | sed -e "s/\:\:[A-Za-z0-9*]*//g" | sort -rn | uniq -c | sort -rn | head -1
  printf "\n"
   printf "\t Year Of Greatest Catalogged Release 2000s"; grep "::${x}::" ALL_FLATDB | grep '::Electronic' | grep "^200[0-9]" |  awk '{FS="::"} {print $1}' | sed -e "s/\:\:[A-Za-z0-9*]*//g" | sort -rn | uniq -c | sort -rn | head -1
  printf "\n"
  printf "\t Year Of Greatest Catalogged Release 1990s"; grep "::${x}::" ALL_FLATDB | grep '::Electronic' | grep "^199[0-9]" |  awk '{FS="::"} {print $1}' | sed -e "s/\:\:[A-Za-z0-9*]*//g" | sort -rn | uniq -c | sort -rn | head -1
  printf "\n"
   printf "\t Year Of Greatest Catalogged Release 1980s"; grep "::${x}::" ALL_FLATDB | grep '::Electronic' | grep "^198[0-9]" |  awk '{FS="::"} {print $1}' | sed -e "s/\:\:[A-Za-z0-9*]*//g" | sort -rn | uniq -c | sort -rn | head -1
  printf "\n\n"
done



