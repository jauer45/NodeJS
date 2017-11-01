#!/usr/bin/bash

# Rolling Test so remove old crap if there
#
if [ ! -d MIDTEST ] 
then
	mkdir MIDTEST
	chmod 755 MIDTEST
elif [ -d MIDTEST ]
then
	rm -rf MIDTEST
	sleep 1
	mkdir MIDTEST
        chmod 755 MIDTEST
else
	echo "Most likely a permission issue. Check your user ACL"
	exit 1;
fi


sleep 1
node autocomposer.js -n '10:7:8:9' -o '6:3:6:4' -p 'x_x-x_x-x_x-x_x_' -a 'x___x_x_x___x_x_' -r 64 -s 'true' -f MIDTEST/testMoreA

sleep 3
chmod 644 MIDTEST/testMoreA.mid

sleep 3
node autocomposer.js -n '0:1:8:9' -o '3:4:7:5' -p 'x_x-x_x-x_x-x_x_' -a 'x___x_x_x___x_x_' -e '11:7' -r 64 -s 'true' -f MIDTEST/testMoreB

sleep 3
chmod 644 MIDTEST/testMoreB.mid

sleep 3

node autocomposer.js -n '0:1:8:9' -o '3:4:7:5' -p 'x_x-x_x-x_x-x_x_' -a 'x___x_x_x___x_x_' -e '3:5' -r 64 -s 'true' -f MIDTEST/testMoreC

sleep 3
chmod 644 MIDTEST/testMoreC.mid

sleep 3

node autocomposer.js -n '0:1:8:9' -o '3:4:7:5' -p 'x_x-x_x-x_x-x_x_' -a 'x___x_x_x___x_x_' -e '7:11' -r 64 -s 'true' -f MIDTEST/testMoreD

sleep 3
chmod 644 MIDTEST/testMoreD.mid

sleep 3

node autocomposer.js -n '0:1:8:9' -o '3:4:7:5' -p 'x_x-x_x-x_x-x_x_' -a 'x___x_x_x___x_x_' -r 64 -s 'true' -f MIDTEST/testMoreE

sleep 3
chmod 644 MIDTEST/testMoreE.mid

sleep 3

node autocomposer.js -n '10:7:8:12' -o '4:3:6:4' -p 'x_x-x_x-x_x-x_x_' -a 'x___x_x_x___x_x_' -e '2:4' -r 64 -s 'true' -f MIDTEST/testMoreF

sleep 1
chmod 644 MIDTEST/testMoreF.mid

exit 1;
