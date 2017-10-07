#! /bin/bash
set -eo nounset

test $# -eq 1

F=`readlink -f $0`
D=`dirname $F`
cd $D

. ./cnf

B=`./truncate-archive-type.sh $1`

echo $B | \
sed "s/^$1//"

