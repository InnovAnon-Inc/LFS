set -eo nounset

cd /sources

rm -rf psmisc-23.1
tar xf psmisc-23.1.tar.xz
pushd  psmisc-23.1

./configure --prefix=/usr

make

make install

mv -v /usr/bin/fuser   /bin
mv -v /usr/bin/killall /bin

popd
rm -rf psmisc-23.1
