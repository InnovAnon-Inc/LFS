set -eo nounset

cd /sources

test -f boost_1_65_1.tar.bz2 || \
wget --no-check-certificate \
	https://dl.bintray.com/boostorg/release/1.65.1/source/boost_1_65_1.tar.bz2

rm -rf boost_1_65_1
tar xf boost_1_65_1.tar.bz2
pushd  boost_1_65_1

sed -e '/using python/ s@;@: /usr/include/python${PYTHON_VERSION/3*/${PYTHON_VERSION}m} ;@' \
    -i bootstrap.sh

./bootstrap.sh --prefix=/usr
./b2 stage threading=multi link=shared

./b2 install threading=multi link=shared

popd
rm -rf boost_1_65_1
