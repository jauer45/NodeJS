#!/bin/sh

APAC=('Japan' 'China' 'Taiwan' 'South_Korea' 'North_Korea' 'Malaysia' 'Indonesia' 'Philippines' 'Laos' 'Cambodia' 'Vietnam');


if [ -f ALL_FLATDB ]; then
	rm ALL_FLATDB
fi

cat FLATDB > ALL_FLATDB
cat FLAT_LATERDB >> ALL_FLATDB



echo 'Catalogged Electronic Music Releases Total Per Country'; grep '::Electronic' ALL_FLATDB | awk '{FS="::"} {print $4}' | sort -rn | uniq -c | sort -rn | head -10

echo "\n"

# for i in ${APAC[@]};
# do
#  x=`echo ${i} | sed "s/_/ /g"`
#  echo 'Catalogged Electronic Music Releases For Asia (Total Per Country) ' ${x};  grep "::${x}::" ALL_FLATDB | grep '::Electronic' | wc -l
# done

# echo "\n"

echo 'Year Of Greatest Catalogged Release 2000s'; cat ALL_FLATDB | grep "^200[0-9]" |  awk '{FS="::"} {print $1}' | sort -rn | uniq -c | sort -rn | head -10

echo "\n"

echo 'Year Of Greatest Catalogged Release 1990s'; cat ALL_FLATDB | grep "^199[0-9]" |  awk '{FS="::"} {print $1}' | sort -rn | uniq -c | sort -rn | head -10


# cat ALL_FLATDB | grep "^199[0-9]" |  awk '{FS="::"} {print $1}' | sort -rn | uniq -c


