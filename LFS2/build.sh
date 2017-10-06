#! /bin/sh
set -exo nounset

test $# -eq 3

F=`readlink -f $0`
D=`dirname $F`
cd $D

. ./cnf

X=`./truncate-archive-type.sh $1`
$D/extract.sh $1

cd $SRCS
cd $X

for k in \
	preconfigure \
	configure \
	premake \
	make \
	preinstall \
	install \
	postinstall ; do
	K=`$D/build-helper.sh $1 $2 $3 $k`
	test ! -z "$K" || \
	continue
	. $K
done

