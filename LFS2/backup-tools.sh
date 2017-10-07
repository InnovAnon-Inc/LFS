#! /bin/bash
set -eo nounset

test $# -eq 0

F=`readlink -f $0`
D=`dirname $F`
cd $D

. ./cnf

tar acpf $TOOLSBKF $LFS/tools

