#!/usr/bin/bash
##!/bin/sh

# Track 1
node autocomposer.js -n '0:1' -o '3:4' -p 'x_x_x_x_x_x_x_x_' -a 'x___x___x___x___' -r 64 -f trackone

sleep 3

# Track 2
node autocomposer.js -n '0:1' -o '3:4' -p 'x_x-x_x-x_x-x_x_' -a 'x___x_x_x___x_x_' -r 64 -f tracktwo

sleep 3

# Track 3
node autocomposer.js -n '0:1' -o '3:4' -p 'x_x-x_x-x_x-x_x_' -a 'x___x___x___x_x_' -r 64 -f trackthree

sleep 3

# Track 4
node autocomposer.js -n '0:1' -o '3:4' -p 'x_x-x_x-x_x-x_x_' -a 'x___x_x_x___x_x_' -r 64 -f trackfour

sleep 3
