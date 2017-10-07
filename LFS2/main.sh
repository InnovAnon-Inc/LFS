#! /bin/bash
set -eo nounset

F=`readlink -f $0`
D=`dirname $F`
cd $D

. ./cnf

./LFS-2.5-Creating-a-File-System-on-the-Partition1 \
	./LFS-2.7+
