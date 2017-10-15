set -eo nounset

cd /sources

test -f openjpeg-2.3.0.tar.gz || \
wget --no-check-certificate \
	 https://github.com/uclouvain/openjpeg/archive/v2.3.0/openjpeg-2.3.0.tar.gz

rm -rf openjpeg-2.3.0
tar xf openjpeg-2.3.0.tar.gz
pushd  openjpeg-2.3.0

mkdir -v build &&
cd       build &&

cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr .. &&
make

make install &&

pushd ../doc &&
  for man in man/man?/* ; do
      install -v -D -m 644 $man /usr/share/$man
  done 
popd

popd
rm -rf openjpeg-2.3.0
