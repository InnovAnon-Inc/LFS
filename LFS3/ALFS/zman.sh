set -eo nounset

test $# -ne 0

for c in $* ; do
	pushd $c
	for k in * ; do
		filename=`basename $k`
		extension=${filename##*.}
		filename=${filename%.*}
		test x$extension != xbz2 || continue
		echo extension=$extension
		if [ -f $k ] ; then
			echo regular file $k
			test -e $k.bz2 || \
			bzip2 -v9 $k -c > $k.bz2
			rm -v $k
		elif [ -L $k ] ; then
			p=`readlink $k`
			echo sym link $k '->' $p
			rm -v $k
			test -e $k.bz2 || \
			ln -sv $p.bz2 $k.bz2
		elif [ -d $k ] ; then
			echo entering dir $c/$k
			/workspace/LFS/LFS3/ALFS/zman.sh $c/$k
		else
			echo unrecognized $c/$k
		fi
	done
	popd
done
