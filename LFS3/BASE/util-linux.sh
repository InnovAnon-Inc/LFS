set -eo nounset

cd /sources

rm -rf util-linux-2.30.2
tar xf util-linux-2.30.2.tar.xz
pushd  util-linux-2.30.2

mkdir -pv /var/lib/hwclock

./configure ADJTIME_PATH=/var/lib/hwclock/adjtime   \
            --docdir=/usr/share/doc/util-linux-2.30.2 \
            --disable-chfn-chsh  \
            --disable-login      \
            --disable-nologin    \
            --disable-su         \
            --disable-setpriv    \
            --disable-runuser    \
            --disable-pylibmount \
            --disable-static     \
            --without-python     \
            --without-systemd    \
            --without-systemdsystemunitdir

make

#bash tests/run.sh --srcdir=$PWD --builddir=$PWD

chown -Rv nobody .
#su nobody -s /bin/bash -c "PATH=$PATH make -k check"

make install

popd
rm -rf util-linux-2.30.2
