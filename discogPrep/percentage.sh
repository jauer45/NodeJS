#!/bin/sh

ret=$(awk "BEGIN {print 10000 / 6000000}")
printf $ret
printf "\n"
res=$(awk "BEGIN {print ${ret} * 100}")
printf $res
printf "\n"
