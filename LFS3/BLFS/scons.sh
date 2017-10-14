set -eo nounset

cd /sources

test -f scons-3.0.0.tar.gz || \
wget --no-check-certificate \
	http://downloads.sourceforge.net/scons/scons-3.0.0.tar.gz

rm -rf scons-3.0.0
tar xf scons-3.0.0.tar.gz
pushd  scons-3.0.0

python setup.py install --prefix=/usr  \
                        --standard-lib \
                        --optimize=1   \
                        --install-data=/usr/share

popd
rm -rf scons-3.0.0

