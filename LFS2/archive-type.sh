#! /bin/sh
set -eo nounset

test $# -eq 1

F=`readlink -f $0`
D=`dirname $F`
cd $D

. ./cnf

B=`./basename.sh $1`

for k in .tar.xz .tar.bz2 .tar.gz ; do
	echo $B | \
	grep -q $k$ || \
	continue
	echo $k
	exit 0
done

