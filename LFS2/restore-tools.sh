#! /bin/bash
set -eo nounset

test $# -eq 0

F=`readlink -f $0`
D=`dirname $F`
cd $D

. ./cnf

rm -fr $LFS/tools
tar apxf $LFS/tools $TOOLSBKF

