#! /bin/bash
set -eo nounset

test $# -eq 4
# img bs count {M,G,T}

F=`readlink -f $0`
D=`dirname $F`
cd $D

. ./cnf

#dd if=/dev/zero of=$1 bs=$2$4 count=$3
truncate -s `expr $2 \* $3`$4 $1

# you'll wanna `tar c - | tar x -`
# from the truncated images
# to dd'd images
# so that the .img files are compressable
