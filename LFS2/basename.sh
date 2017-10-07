#! /bin/bash
set -eo nounset

test $# -eq 1

F=`readlink -f $0`
D=`dirname $F`
cd $D

. ./cnf

cat $SRCS/wget-list | \
while read k ; do
	B=`basename $k`
	echo $B | \
	grep -v \\.patch | \
	grep -q ^$1 || \
	continue
	echo $B
done

