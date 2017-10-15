set -eo nounset

#cd /other-repos || cd /repos

#if [ -d dbus-python ] ; then
#	pushd dbus-python
#	git reset --hard
#	git clean -d -f -x
#	git pull origin master
#	popd
#else
#	git clone https://github.com/dlitz/dbus-python.git
#fi

#cd dbus-python

cd /sources

test -f dbus-python-1.2.4.tar.gz || \
wget --no-check-certificate \
	https://dbus.freedesktop.org/releases/dbus-python/dbus-python-1.2.4.tar.gz

rm -rf dbus-python-1.2.4
tar xf dbus-python-1.2.4.tar.gz
pushd  dbus-python-1.2.4

mkdir python2 &&
pushd python2 &&
PYTHON=/usr/bin/python     \
../configure --prefix=/usr --docdir=/usr/share/doc/dbus-python-1.2.4 &&
make &&
popd

mkdir python3 &&
pushd python3 &&
PYTHON=/usr/bin/python3    \
../configure --prefix=/usr --docdir=/usr/share/doc/dbus-python-1.2.4 &&
make &&
popd

make -C python2 install
make -C python3 install

popd
rm -rf dbus-python-1.2.4
