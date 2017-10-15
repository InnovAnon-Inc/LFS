set -eo nounset

cd /sources

for k in \
http://downloads.sourceforge.net/lcms/lcms-1.19.tar.gz \
http://www.linuxfromscratch.org/patches/blfs/svn/lcms-1.19-cve_2013_4276-1.patch ; do
test -f `basename $k` || \
wget --no-check-certificate \
	$k
done

rm -rf lcms-1.19
tar xf lcms-1.19.tar.gz
pushd  lcms-1.19

patch -Np1 -i ../lcms-1.19-cve_2013_4276-1.patch

./configure --prefix=/usr --disable-static
make

make install
install -v -m755 -d /usr/share/doc/lcms-1.19
install -v -m644    README.1ST doc/* \
                    /usr/share/doc/lcms-1.19

popd
rm -rf lcms-1.19

