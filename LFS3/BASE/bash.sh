set -eo nounset

cd /sources

rm -rf bash-4.4
tar xf bash-4.4.tar.gz
pushd  bash-4.4

patch -Np1 -i ../bash-4.4-upstream_fixes-1.patch

./configure --prefix=/usr                       \
            --docdir=/usr/share/doc/bash-4.4 \
            --without-bash-malloc               \
            --with-installed-readline

make

chown -Rv nobody .

#su nobody -s /bin/bash -c "PATH=$PATH make tests"

make install
mv -vf /usr/bin/bash /bin

#exec /bin/bash --login +h

popd
rm -rf bash-4.4
