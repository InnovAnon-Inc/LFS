set -eo nounset

cd /sources

for k in \
https://downloads.sourceforge.net/clucene/clucene-core-2.3.3.4.tar.gz \
http://www.linuxfromscratch.org/patches/blfs/svn/clucene-2.3.3.4-contribs_lib-1.patch ; do
test -f `basename $k` || \
wget --no-check-certificate \
	$k
done

rm -rf clucene-core-2.3.3.4
tar xf clucene-core-2.3.3.4.tar.gz
pushd  clucene-core-2.3.3.4

patch -Np1 -i ../clucene-2.3.3.4-contribs_lib-1.patch &&

mkdir build &&
cd    build &&

cmake -DCMAKE_INSTALL_PREFIX=/usr \
      -DBUILD_CONTRIBS_LIB=ON .. &&
make

make install

popd
rm -rf clucene-core-2.3.3.4
