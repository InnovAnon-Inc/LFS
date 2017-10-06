#! /bin/sh
set -eo nounset

test $# -eq 1

F=`readlink -f $0`
D=`dirname $F`
cd $D

. ./cnf

B=`./basename.sh $1`
EXT=`./archive-type.sh $1`

echo $B | \
sed "s/$EXT$//"

