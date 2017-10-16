set -eo nounset

cd /sources

for k in \
https://ftp.gnu.org/gnu/autoconf/autoconf-2.64.tar.xz ; do
test -f `basename $k` || \
wget --no-check-certificate \
	$k
done

rm -rf autoconf-2.64
tar xf autoconf-2.64.tar.xz
pushd  autoconf-2.64

#mv -v autoconf.texi autoconf-264.texi
#rm -v autoconf.info

./configure --prefix=/usr --program-suffix=-2.64
make

make install
#install -v -m644 autoconf-264.info /usr/share/info
#install-info --info-dir=/usr/share/info autoconf-264.info

popd
rm -rf autoconf-2.64

