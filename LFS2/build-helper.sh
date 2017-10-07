#! /bin/sh
set -eo nounset

test $# -eq 4 || test $# -eq 3

F=`readlink -f $0`
D=`dirname $F`
cd $D

. ./cnf

X=`./truncate-archive-type.sh $1`

# 1: binutils
# 2: tools/chroot
# 3: pass1/pass2
# 4: configure/make/install
if test $# -eq 4 ; then
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
else
	if [ -f $D/$3-$2-$1 ] ; then
		echo $D/$3-$2-$1
	elif [ -f $D/$3-$2 ] ; then
		echo $D/$3-$2
	elif [ -f $D/$3 ] ; then
		echo $D/$3
	fi
fi

