set -eo nounset

if [ $# -eq 1 ] ; then
	BLD=$1
	PKG=$BLD.tar.*
	SRC=$BLD
elif [ $# -eq 2 ] ; then
	BLD=$1
	PKG=$BLD.tar.*
	SRC=$2
elif [ $# -eq 3 ] ; then
	BLD=$1
	PKG=$2
	SRC=$3
fi
test ! -z ${PKG+x}
test ! -z ${SRC+x}
test ! -z ${BLD+x}

cd /sources

rm -rf $SRC
mkdir -v $SRC
tar xf $PKG -C $SRC --strip-components=1
pushd $SRC

$BLD

popd
rm -rf $SRC

