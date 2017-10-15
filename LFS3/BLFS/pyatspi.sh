set -eo nounset

#cd /other-repos || cd /repos

#if [ -d pyatspi ] ; then
#	pushd pyatspi
#	git reset --hard
#	git clean -d -f -x
#	git pull origin master
#	popd
#else
#	git clone https://github.com/dlitz/pyatspi.git
#fi

#cd pyatspi

cd /sources

test -f pyatspi-2.26.0.tar.xz || \
wget --no-check-certificate \
	http://ftp.gnome.org/pub/gnome/sources/pyatspi/2.26/pyatspi-2.26.0.tar.xz

rm -rf pyatspi-2.26.0
tar xf pyatspi-2.26.0.tar.xz
pushd  pyatspi-2.26.0

mkdir python2 &&
pushd python2 &&
../configure --prefix=/usr --with-python=/usr/bin/python &&
make &&
popd

mkdir python3 &&
pushd python3 &&
../configure --prefix=/usr --with-python=/usr/bin/python3 &&
make &&
popd

make -C python2 install
make -C python3 install

popd
rm -rf pyatspi-2.26.0
