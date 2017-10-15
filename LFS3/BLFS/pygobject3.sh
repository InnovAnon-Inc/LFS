set -eo nounset

#cd /other-repos || cd /repos

#if [ -d pygobject3 ] ; then
#	pushd pygobject3
#	git reset --hard
#	git clean -d -f -x
#	git pull origin master
#	popd
#else
#	# TODO
#	git clone https://github.com/takluyver/pygobject3.git
#fi
#
#cd pygobject3

cd /sources

test -f pygobject-3.26.0.tar.xz || \
wget --no-check-certificate \
	http://ftp.gnome.org/pub/gnome/sources/pygobject/3.26/pygobject-3.26.0.tar.xz

rm -rf pygobject-3.26.0
tar xf pygobject-3.26.0.tar.xz
pushd  pygobject-3.26.0

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
rm -rf pygobject-3.26.0

