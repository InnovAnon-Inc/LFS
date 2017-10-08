cd /sources

if [ ! -f distcc.txz ] ; then
	test -d distcc || \
	git clone git://github.com/distcc/distcc.git
	tar acf distcc.txz distcc
fi

rm -rf distcc-src
mkdir -v distcc-src
tar xf distcc.txz --strip-components=1 -C distcc-src
cd distcc-src

./autogen.sh
./configure --enable-profile
make
make install
