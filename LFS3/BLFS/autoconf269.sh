set -eo nounset

cd /sources

for k in \
https://ftp.gnu.org/gnu/autoconf/autoconf-2.69.tar.xz ; do
test -f `basename $k` || \
wget --no-check-certificate \
	$k
done

rm -rf autoconf-2.69
tar xf autoconf-2.69.tar.xz
pushd  autoconf-2.69

./configure --prefix=/usr --program-suffix=-2.69
make

make install
install -v -m644 autoconf-269.info /usr/share/info
install-info --info-dir=/usr/share/info autoconf-269.info

popd
rm -rf autoconf-2.69

