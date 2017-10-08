cd /sources

test -f ccache-3.3.4.tar.xz || \
wget --no-check-certificate \
	https://www.samba.org/ftp/ccache/ccache-3.3.4.tar.xz

rm -rf ccache-3.3.4
tar xf ccache-3.3.4.tar.xz
cd ccache-3.3.4

./configure
make
make install

test -d /usr/lib/ccache || \
mkdir -v /usr/lib/ccache

for k in \
c++ \
g++ \
gcc \
gcc-7.2.0 \
gcc-ar \
gcc-nm \
gcc-ranlib ; do
#test -L /usr/lib/ccache/$k || \

rm -f /usr/lib/ccache/$k
ln -v -s /usr/local/bin/ccache /usr/lib/ccache/x86_64-pc-linux-gnu-$k
ln -v -s /usr/local/bin/ccache /usr/lib/ccache/$k
done
