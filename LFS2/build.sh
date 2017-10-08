#! /bin/bash
set -eo nounset

test $# -eq 3 || test $# -eq 2

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
	test \
	preinstall \
	install \
	postinstall \
	check ; do
	K=`$D/build-helper.sh $* $k`
	test ! -z "$K" || \
	continue
	. $K
done

SUF=`echo $* | \
sed 's/ /-/g'`
tar acpf $BKFS/tools-$SUF.txz /tools
