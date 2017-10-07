#! /bin/bash
set -eo nounset

test $# -eq 1

F=`readlink -f $0`
D=`dirname $F`
cd $D

. ./cnf

P=`./basename.sh $1`
#V=`./version.sh $1`
X=`./truncate-archive-type.sh $1`

cd $SRCS

rm -fr $X
mkdir -v $X
tar xf $P -C $X --strip-components=1

