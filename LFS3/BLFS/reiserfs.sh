set -eo nounset

cd /sources

test -f reiserfsprogs-3.6.27.tar.xz || \
wget --no-check-certificate \
	https://www.kernel.org/pub/linux/kernel/people/jeffm/reiserfsprogs/v3.6.27/reiserfsprogs-3.6.27.tar.xz

rm -rf reiserfsprogs-3.6.27
tar xf reiserfsprogs-3.6.27.tar.xz
pushd  reiserfsprogs-3.6.27

autoreconf -fiv             &&
./configure --prefix=/usr   \
            --sbindir=/sbin &&

make

make install

popd
rm -rf reiserfsprogs-3.6.27
