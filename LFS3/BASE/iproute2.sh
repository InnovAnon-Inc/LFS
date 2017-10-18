set -eo nounset
set +h

cd /sources

rm -rf iproute2-4.13.0
tar xf iproute2-4.13.0.tar.xz
pushd  iproute2-4.13.0

sed -i /ARPD/d Makefile
sed -i 's/arpd.8//' man/man8/Makefile
rm -v doc/arpd.sgml

sed -i 's/m_ipt.o//' tc/Makefile

make

make DOCDIR=/usr/share/doc/iproute2-4.13.0 install

popd
rm -rf iproute2-4.13.0
