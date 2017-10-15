set -eo nounset

cd /sources

test -f libxml2-python-2.6.21.tar.gz || \
wget --no-check-certificate \
	ftp://xmlsoft.org/libxml2/python/libxml2-python-2.6.21.tar.gz

rm -rf libxml2-python-2.6.21
tar xf libxml2-python-2.6.21.tar.gz
pushd  libxml2-python-2.6.21

python setup.py build
python setup.py install --optimize=1 --prefix=/usr
#python3 setup.py build
#python3 setup.py install --optimize=1 --prefix=/usr

popd
rm -rf libxml2-python-2.6.21
