set -eo nounset

cd /sources

test -f yaml-0.1.7.tar.gz || \
wget --no-check-certificate \
	http://pyyaml.org/download/libyaml/yaml-0.1.7.tar.gz

rm -rf yaml-0.1.7
tar xf yaml-0.1.7.tar.gz
pushd  yaml-0.1.7

./configure --prefix=/usr --disable-static &&
make

make install

popd
rm -rf yaml-0.1.7
