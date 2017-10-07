#! /bin/bash
set -eo nounset

test $# -eq 3 || test $# -eq 2

F=`readlink -f $0`
D=`dirname $F`
cd $D

. ./cnf

if [ $# -eq 4 ] ; then
	B=$D/show-build.sh
	shift
else
	B=$D/build.sh
fi

trap "$D/LFS-2.5-Creating-a-File-System-on-the-Partition0" 0
$D/LFS-2.7-Mounting-the-New-Partition

if [ "x$2" = xtools ] ; then
	./LFS-4.3-Adding-the-LFS-User1 $B $*
elif [ "x$2" = xchroot ] ; then
	./LFS-6.4-Entering-the-Chroot-Environment $B $*
else exit 1
fi

