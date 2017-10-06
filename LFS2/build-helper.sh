#! /bin/sh
set -eo nounset

test $# -eq 4

F=`readlink -f $0`
D=`dirname $F`
cd $D

. ./cnf

X=`./truncate-archive-type.sh $1`

# 1: binutils
# 2: tools/chroot
# 3: pass1/pass2
# 4: configure/make/install
if [ -f $D/$4-$2-$1-$3 ] ; then
	echo $D/$4-$2-$1-$3
elif [ -f $D/$4-$2-$1 ] ; then
	echo $D/$4-$2-$1
elif [ -f $D/$4-$2 ] ; then
	echo $D/$4-$2
#else echo $4
elif [ -f $D/$4 ] ; then
	echo $D/$4
fi

