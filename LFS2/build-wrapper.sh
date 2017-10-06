#! /bin/sh
set -exo nounset

test $# -eq 3

F=`readlink -f $0`
D=`dirname $F`
cd $D

. ./cnf

if [ "x$2" = xtools ] ; then
	./LFS-4.3-Adding-the-LFS-User1 $D/build.sh $*
elif [ "x$2" = xchroot ] ; then
	? $D/build.sh $*
else exit 1
fi

