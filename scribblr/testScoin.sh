#!/usr/bin/bash

# Rolling Test so remove old crap if there
#
if [ ! -d S_MIDTEST ] 
then
	mkdir S_MIDTEST
	chmod 755 S_MIDTEST
elif [ -d S_MIDTEST ]
then
	rm -rf S_MIDTEST
	sleep 1
	mkdir S_MIDTEST
        chmod 755 S_MIDTEST
else
	echo "Most likely a permission issue. Check your user ACL"
	exit 1;
fi


sleep 1
node soundchain.js -b 1 -n '10:7:8:9' -o '6:3:6:4' -p 'x_x-x_x-x_x-x_x_' -a 'x___x_x_x___x_x_' -r 64 -s 'true' -f S_MIDTEST/testMoreA

sleep 3
chmod 644 S_MIDTEST/testMoreA.mid

sleep 3
node soundchain.js -b 2 -n '0:1:8:9' -o '3:4:7:5' -p 'x_x-x_x-x_x-x_x_' -a 'x___x_x_x___x_x_' -e '11:7' -r 64 -s 'true' -f S_MIDTEST/testMoreB

sleep 3
chmod 644 S_MIDTEST/testMoreB.mid

sleep 3

node soundchain.js -b 3 -n '0:1:8:9' -o '3:4:7:5' -p 'x_x-x_x-x_x-x_x_' -a 'x___x_x_x___x_x_' -e '3:5' -r 64 -s 'true' -f S_MIDTEST/testMoreC

sleep 3
chmod 644 S_MIDTEST/testMoreC.mid

sleep 3

node soundchain.js -b 4 -n '0:1:8:9' -o '3:4:7:5' -p 'x_x-x_x-x_x-x_x_' -a 'x___x_x_x___x_x_' -e '7:11' -r 64 -s 'true' -f S_MIDTEST/testMoreD

sleep 3
chmod 644 S_MIDTEST/testMoreD.mid

exit 1;
