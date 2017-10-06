#! /bin/sh
set -eo nounset

F=`readlink -f $0`
D=`dirname $F`
cd $D

. ./cnf

./build.sh binutils tools pass1
