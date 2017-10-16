set -eo nounset

cd /sources

test -f yasm-1.3.0.tar.gz || \
wget --no-check-certificate \
	http://www.tortall.net/projects/yasm/releases/yasm-1.3.0.tar.gz

rm -rf yasm-1.3.0
tar xf yasm-1.3.0.tar.gz
pushd  yasm-1.3.0

sed -i 's#) ytasm.*#)#' Makefile.in &&

./configure --prefix=/usr &&
make

make install

popd
rm -rf yasm-1.3.0
