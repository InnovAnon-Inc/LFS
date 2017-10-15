set -eo nounset

cd /sources

test -f icu4c-59_1-src.tgz || \
wget --no-check-certificate \
	 http://download.icu-project.org/files/icu4c/59.1/icu4c-59_1-src.tgz

rm -rf icu
tar xf icu4c-59_1-src.tgz
pushd  icu

cd source
sed -i 's/xlocale/locale/' i18n/digitlst.cpp
./configure --prefix=/usr
make

make install

popd
rm -rf icu

