cd /sources

if [ ! -f lapack-release.txz ] ; then
	test -d lapack-release || \
	git clone git://github.com/Reference-LAPACK/lapack-release.git
	tar acf lapack-release.txz lapack-release
fi

rm -rf lapack-release-src
mkdir -v lapack-release-src
tar xf lapack-release.txz --strip-components=1 -C lapack-release-src
cd lapack-release-src

cp make.inc.example make.inc
cmake .
make
make install
